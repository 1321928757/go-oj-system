<template>
  <div class="e-box">
    <div class="select">
      <el-select v-model="language" @change="changeLanguage">
        <el-option value="go">go</el-option>
      </el-select>
    </div>
    <div id="codeEditBox"></div>
    <div class="submit">
      <el-button type="primary" @click="submitCode" :loading="loading">提交</el-button>
    </div>
    <div class="sub-box">
     <p>编译结果： {{msg}}</p>
     <p>通过案例数: {{ submitResult.pass_num }}</p>
     <P>测试案例数: {{ submitResult.test_num }}</P>
    </div>
  </div>
</template>
<script lang="ts" setup>
import jsonWorker from 'monaco-editor/esm/vs/language/json/json.worker?worker'
import cssWorker from 'monaco-editor/esm/vs/language/css/css.worker?worker'
import htmlWorker from 'monaco-editor/esm/vs/language/html/html.worker?worker'
import tsWorker from 'monaco-editor/esm/vs/language/typescript/ts.worker?worker'
import EditorWorker from 'monaco-editor/esm/vs/editor/editor.worker?worker'
import * as monaco from 'monaco-editor';
import { nextTick,ref,onBeforeUnmount } from 'vue'
import {useRoute} from 'vue-router'
import api from '../../api/api.js'
 
import {ElMessage} from 'element-plus'
const codeInfo = ref(
  {
    code: "",
    problemId: 0
  }
)
const route=useRoute()
const language=ref('go')
const msg=ref()
const submitResult=ref({})
const loading=ref(false)

codeInfo.value.problemId = parseInt(route.query.id as string)
// 
// MonacoEditor start
//
 onBeforeUnmount(()=>{
   editor.dispose() 
 })
// @ts-ignore
self.MonacoEnvironment = {
  getWorker(_: string, label: string) {
    if (label === 'json') {
      return new jsonWorker()
    }
    if (label === 'css' || label === 'scss' || label === 'less') {
      return new cssWorker()
    }
    if (label === 'html' || label === 'handlebars' || label === 'razor') {
      return new htmlWorker()
    }
    if (['typescript', 'javascript'].includes(label)) {
      return new tsWorker()
    }
    return new EditorWorker()
  },
}
let editor: monaco.editor.IStandaloneCodeEditor;

const editorInit = () => {
    nextTick(()=>{
        monaco.languages.typescript.javascriptDefaults.setDiagnosticsOptions({
            noSemanticValidation: true,
            noSyntaxValidation: false
        });
        monaco.languages.typescript.javascriptDefaults.setCompilerOptions({
            target: monaco.languages.typescript.ScriptTarget.ES2016,
            allowNonTsExtensions: true
        });
        
        !editor ? editor = monaco.editor.create(document.getElementById('codeEditBox') as HTMLElement, {
            value:codeInfo.value.code, // 编辑器初始显示文字
            language: 'go', // 语言支持自行查阅demo
            automaticLayout: true, // 自适应布局  
            theme: 'vs-dark', // 官方自带三种主题vs, hc-black, or vs-dark
            foldingStrategy: 'indentation',
            renderLineHighlight: 'all', // 行亮
            selectOnLineNumbers: true, // 显示行号
            minimap:{
                enabled: false,
            },
            readOnly: false, // 只读
            fontSize: 16, // 字体大小
            scrollBeyondLastLine: false, // 取消代码后面一大段空白 
            overviewRulerBorder: false, // 不要滚动条的边框  
        }) : 
        editor.setValue("");
        // console.log(editor)
        // 监听值的变化
        editor.onDidChangeModelContent((val:any) => {
          codeInfo.value.code = editor.getValue();
        })
    })
}
editorInit()
// @ts-ignore
const changeLanguage=()=>{
   monaco.editor.setModelLanguage(editor.getModel(), language.value)
        

  //  editor.updateOptions({
  //           language: "objective-c"
  //       });
}
const submitCode=()=>{
  loading.value=true
  api.submitCode(codeInfo.value).then(res=>{
    loading.value=false
      if(res.data.code==200){ 
        submitResult.value = res.data.data
        switch(res.data.data.status) {
          case 1:
          ElMessage.success("编译通过")
          msg.value = "编译通过"
          break
          case -1:
          ElMessage.success("代码判断中，请稍等")
          msg.value = "代码判断中，请稍等"
          break
          case 2:
          ElMessage.success("答案错误")
          msg.value = "答案错误"
          break
          case 3:
          ElMessage.success("运行超时")
          msg.value = "运行超时"
          break
          case 4:
          ElMessage.success("运行超内存")
          msg.value = "运行超内存"
          break
          case 5:
          ElMessage.success("编译错误")
          msg.value = "编译错误"
          break
          case 6:
          ElMessage.success("非法代码")
          msg.value = "非法代码，请使用规定范围内的包(bytes,fmt,math,sort,string)"
          break
        }
      
       
      }else{
        ElMessage.error(res.data)
      }
  })
}
/***
 * editor.setValue(newValue)

editor.getValue()

editor.onDidChangeModelContent((val)=>{ //监听值的变化  })

editor.getAction('editor.action.formatDocument').run()    //格式化代码

editor.dispose()    //销毁实例

editor.onDidChangeOptions　　//配置改变事件

editor.onDidChangeLanguage　　//语言改变事件
 */
</script>
<style scoped lang="scss">
#codeEditBox {
  //  width: 100%;
  height: 50%;
}
.select{
  padding: 10px 0;
}
.submit{
  text-align: center;
  padding: 10px 0;
  
}
.e-box{
  width: 100%;
  padding: 10px ;
  box-sizing: border-box;
  height: 100%;
  display: flex;
  justify-content: space-between;
  box-sizing: border-box;
  flex-direction: column;
}
.sub-box{
  border-radius: 10px;
  background-color: #999;
  padding: 10px;
  box-sizing: border-box;
  flex: 1;
  color: white;
}
</style>