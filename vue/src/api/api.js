import http from './http.js'

 
export default{
	//  get请求示例
	getProblemList(param){ //问题列表
		return http.get(`/api/problem/list`,param)
	},
	getProblemDetail(param){//问题详情
		return http.get(`/api/problem/detail`,param)
	},
	getSortList(param){//分类列表
		return http.get(`/api/category/list`,param)
	},
	getRankList(param){//排行榜
		return http.get(`/api/user/rank`,param)
	},
	getSubmitList(param){//提交列表
		return http.get(`/api/submit/list`,param)
	},
	sendCode(param){//发送验证码
		return http.postUncode(`/api/captcha/send_email`,param)
	},
	login(param){//登录
		return http.postJson(`/api/user/login`,param)
	},
	register(param){//注册
		return http.postJson(`/api/user/register`,param)
	},
	delSort(param){//删除
		return http.delete(`/api/category/delete`,param)
	},
	addSort(param){//分类创建
		return http.postUncode(`/api/category/add`,param)
	},
	addProblem(param){//问题创建
		return http.post(`/api/problem/add`,param)
	},
	editProblem(param){//问题编辑
		return http.putJson(`/api/problem/update`,param)
	},
	editSort(param){//分类编辑
		return http.put(`/api/category/update`,param)
	},
	submitCode(param){//提交代码
		return http.postJson(`/api/submit/commit`,param)
	},
	// 文件上传
	uploadFile(param){
		return http.upFile('',param)
	},
	
	
 
	 
}
