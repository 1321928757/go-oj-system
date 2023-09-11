import{d as j,s as c,n as L,C as b,p as M,r as d,o as B,j as P,g as a,w as l,u as t,h as S,c as z,l as g,t as h,E as m}from"./vendor.e61da12b.js";import{a as C}from"./api.03f0bf99.js";import{_ as G}from"./plugin-vue_export-helper.21dcd24c.js";const H={class:"login-page"},J={style:{"text-align":"center"}},K=g("\u767B\u5F55 "),O=g("\u53D1\u9001\u9A8C\u8BC1\u7801"),Q={style:{"text-align":"center"}},W=g("\u6CE8\u518C "),X=j({emits:["loginSucc"],setup(Y,{emit:U}){const f=c("login"),D=(r,e)=>{console.log(r,e)},F=c("default"),V=L(),w=c(),v=c(),p=c(60),i=b({username:"",password:""}),s=b({username:"",password:"",mail:"",vericode:""}),y=b({username:[{required:!0,message:"\u8BF7\u8F93\u5165\u7528\u6237\u540D",trigger:"blur"}],vericode:[{required:!0,message:"\u8BF7\u8F93\u5165\u9A8C\u8BC1\u7801",trigger:"blur"}],mail:[{required:!0,message:"\u8BF7\u8F93\u5165\u90AE\u7BB1",trigger:"blur"}],password:[{required:!0,message:"\u8BF7\u8F93\u5165\u5BC6\u7801",trigger:"blur"}]}),R=M();console.log(R);const q=async r=>{!r||await r.validate((e,n)=>{e?C.login(i).then(o=>{o.data.code==200?(m.success("\u767B\u5F55\u6210\u529F"),localStorage.setItem("token",o.data.data.token),V.commit("loginSucc",o.data.data.token),V.commit("setUser",o.data.data),localStorage.setItem("is_admin",o.data.data.is_admin),localStorage.setItem("username",i.username),U("loginSucc")):m.error(o.data.message)}):console.log("error submit!",n)})},I=async r=>{!r||await r.validate((e,n)=>{e?C.register(s).then(o=>{o.data.code==200?(m.success("\u6CE8\u518C\u6210\u529F,\u8BF7\u7EE7\u7EED\u767B\u5F55~"),f.value="login",N(v.value)):m.error(o.data.message)}):console.log("error submit!",n)})},N=r=>{!r||r.resetFields()},k=()=>{p.value>0?(p.value--,setTimeout(k,1e3)):p.value=60},T=()=>{/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(s.mail)?(k(),C.sendCode({email:s.mail}).then(e=>{e.data.code==200?m.success(e.data.message):m.error(e.data.message)})):m("\u8BF7\u8F93\u5165\u6B63\u786E\u7684\u90AE\u7BB1")};return(r,e)=>{const n=d("el-input"),o=d("el-form-item"),_=d("el-button"),x=d("el-form"),E=d("el-tab-pane"),A=d("el-col"),Z=d("el-row"),$=d("el-tabs");return B(),P("div",H,[a($,{modelValue:f.value,"onUpdate:modelValue":e[8]||(e[8]=u=>f.value=u),type:"card",class:"demo-tabs",onTabClick:D},{default:l(()=>[a(E,{label:"\u767B\u5F55",name:"login"},{default:l(()=>[a(x,{ref_key:"ruleFormRef",ref:w,model:t(i),rules:t(y),"label-width":"80px",class:"login-form",size:F.value},{default:l(()=>[a(o,{label:"\u8D26\u6237",prop:"username"},{default:l(()=>[a(n,{modelValue:t(i).username,"onUpdate:modelValue":e[0]||(e[0]=u=>t(i).username=u)},null,8,["modelValue"])]),_:1}),a(o,{label:"\u5BC6\u7801",prop:"password"},{default:l(()=>[a(n,{modelValue:t(i).password,"onUpdate:modelValue":e[1]||(e[1]=u=>t(i).password=u),"show-password":""},null,8,["modelValue"])]),_:1}),S("div",J,[a(_,{type:"primary",onClick:e[2]||(e[2]=u=>q(w.value))},{default:l(()=>[K]),_:1})])]),_:1},8,["model","rules","size"])]),_:1}),a(E,{label:"\u6CE8\u518C",name:"register"},{default:l(()=>[a(x,{ref_key:"registFormRef",ref:v,model:t(s),rules:t(y),"label-width":"80px",class:"login-form",size:F.value},{default:l(()=>[a(o,{label:"\u8D26\u6237",prop:"username"},{default:l(()=>[a(n,{modelValue:t(s).username,"onUpdate:modelValue":e[3]||(e[3]=u=>t(s).username=u)},null,8,["modelValue"])]),_:1}),a(o,{label:"\u5BC6\u7801",prop:"password"},{default:l(()=>[a(n,{modelValue:t(s).password,"onUpdate:modelValue":e[4]||(e[4]=u=>t(s).password=u),"show-password":""},null,8,["modelValue"])]),_:1}),a(o,{label:"\u90AE\u7BB1",prop:"mail"},{default:l(()=>[a(n,{modelValue:t(s).mail,"onUpdate:modelValue":e[5]||(e[5]=u=>t(s).mail=u)},null,8,["modelValue"])]),_:1}),a(o,{label:"\u9A8C\u8BC1\u7801",prop:"vericode"},{default:l(()=>[a(Z,{gutter:20},{default:l(()=>[a(A,{span:12},{default:l(()=>[a(n,{modelValue:t(s).vericode,"onUpdate:modelValue":e[6]||(e[6]=u=>t(s).vericode=u)},null,8,["modelValue"])]),_:1}),a(A,{span:12,style:{"text-align":"right"}},{default:l(()=>[p.value>0&&p.value<60?(B(),z(_,{key:0,disabled:""},{default:l(()=>[g(h(p.value)+"\u79D2",1)]),_:1})):(B(),z(_,{key:1,onClick:T,type:"primary"},{default:l(()=>[O]),_:1}))]),_:1})]),_:1})]),_:1}),S("div",Q,[a(_,{type:"primary",onClick:e[7]||(e[7]=u=>I(v.value))},{default:l(()=>[W]),_:1})])]),_:1},8,["model","rules","size"])]),_:1})]),_:1},8,["modelValue"])])}}});var oe=G(X,[["__scopeId","data-v-7dbd95c0"]]);export{oe as default};