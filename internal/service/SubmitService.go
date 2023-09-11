package service

import (
	"bytes"
	"errors"
	"io"
	"log"
	"online-practice-system/global"
	"online-practice-system/internal/common/request"
	"online-practice-system/internal/dao"
	"online-practice-system/internal/model"
	"online-practice-system/internal/vo"
	"online-practice-system/utils/File"
	"online-practice-system/utils/str"
	"os/exec"
	"runtime"
	"sync"
	"time"
)

type submitService struct{}

var SubmitService = new(submitService)

// 分页条件查询提交记录
func (submitService) GetSubmitList(pageNum int, pageSize int, status int) (submitPageVo vo.SubmitPageVo, err error) {
	err, list, total := dao.SubmitDao.GetSubmitList(pageNum, pageSize, status)
	if err != nil {
		return
	}
	submitPageVo = vo.SubmitPageVo{
		PageList: list,
		Count:    total,
	}
	return
}

// 保存代码提交并开始判题
func (s submitService) SaveSubmitAndJudge(userId uint, userMail string,
	param request.SubmitSendParam) (submitBasic *model.SubmitBasic, err error) {
	// 将代码保存到本地
	path := global.App.Config.Storage.Drivers.Local.RootDir + "/code/" +
		userMail + "/" + str.GetUuid() + "/" + "main.go"

	File.FileSave(path, []byte(param.Code))

	// 创建提交记录基本信息
	submitBasic = &model.SubmitBasic{
		UserId:    userId,
		ProblemId: param.ProblemId,
		Path:      path,
		Status:    -1,
	}

	// 开始判题
	// 1. 获取题目信息
	problem, err := dao.ProblemDao.GetProblemTestCaseById(param.ProblemId)
	if err != nil {
		err = errors.New("提交失败，获取题目信息失败")
		return
	}
	//如果不存在测试案例，直接返回
	if len(problem.TestCases) == 0 {
		err = errors.New("提交失败，题目测试用例不存在")
		return
	}
	// 2. 定义判题结果的channel
	// 答案错误的channel
	WA := make(chan int)
	// 超内存的channel
	OOM := make(chan int)
	// 编译错误的channel
	CE := make(chan int)
	// 答案正确的channel
	AC := make(chan int)
	// 非法代码的channel
	EC := make(chan int)
	// 通过的个数
	passCount := 0
	// 锁
	var lock sync.Mutex
	// 简单检测代码合法性（检测使用的包是否合法，防止恶意代码）
	v, err := str.CheckGoCodeValid(path)
	if err != nil {
		return
	}

	// 3. 开启协程进行判题
	if !v {
		// 非法代码
		EC <- 1
	} else {
		// 通过测试用例的个数
		passCount = 0
		// 遍历测试用例
		for _, testCase := range problem.TestCases {
			// 开启协程进行判题
			go judgeCode(path, &passCount, AC, CE, WA, OOM, testCase, &problem, &lock)
		}
	}
	select {
	case <-EC:
		submitBasic.Status = 6
	case <-WA:
		submitBasic.Status = 2
	case <-OOM:
		submitBasic.Status = 4
	case <-CE:
		submitBasic.Status = 5
	case <-AC:
		submitBasic.Status = 1
	case <-time.After(time.Millisecond * time.Duration(problem.MaxRuntime)):
		if passCount == len(problem.TestCases) {
			submitBasic.Status = 1
		} else {
			submitBasic.Status = 3
		}
	}
	submitBasic.PassNum = passCount
	submitBasic.TestNum = len(problem.TestCases)

	// 4. 保存提交记录,同时修改题目通过数和提交数，用户的相关信息
	// 开启事务
	tx := global.App.DB.Begin()
	err = dao.SubmitDao.SaveSubmit(tx, submitBasic)
	if err != nil {
		err = errors.New("提交失败，保存提交记录时出现错误")
		tx.Rollback()
		return
	}
	// 修改通过数和提交数
	if submitBasic.Status == 1 {
		//通过数+1，提交数+1
		err = dao.ProblemDao.UpdateSubmitAndPassInfo(tx, param.ProblemId, 1, 1)
		err = dao.UserDao.UpdateSubmitAndPassInfo(tx, userId, 1, 1)

	} else {
		//提交数+1
		err = dao.ProblemDao.UpdateSubmitAndPassInfo(tx, param.ProblemId, 1, 0)
		err = dao.UserDao.UpdateSubmitAndPassInfo(tx, userId, 1, 0)
	}
	if err != nil {
		err = errors.New("提交失败，更新题目通过数和提交数时出现错误")
		tx.Rollback()
		return
	}
	// 提交事务
	tx.Commit()
	return
}

func judgeCode(path string, passCount *int, AC chan int, CE chan int,
	WA chan int, OOM chan int, testCase *model.TestCase, problem *model.ProblemBasic, lock *sync.Mutex) {
	cmd := exec.Command("go", "run", path)
	var out, stderr bytes.Buffer
	cmd.Stderr = &stderr
	cmd.Stdout = &out
	stdinPipe, err := cmd.StdinPipe()
	if err != nil {
		log.Fatalln(err)
	}
	io.WriteString(stdinPipe, testCase.Input+"\n")

	var bm runtime.MemStats
	runtime.ReadMemStats(&bm)
	if err := cmd.Run(); err != nil {
		log.Println(err, stderr.String())
		if err.Error() == "exit status 2" {
			CE <- 1
			return
		}
	}
	var em runtime.MemStats
	runtime.ReadMemStats(&em)

	// 答案错误
	if testCase.Output != out.String() {
		WA <- 1
		return
	}
	// 运行超内存
	if em.Alloc/1024-(bm.Alloc/1024) > uint64(problem.MaxMem) {
		OOM <- 1
		return
	}
	lock.Lock()
	*passCount++
	if *passCount == len(problem.TestCases) {
		AC <- 1
	}
	lock.Unlock()
}
