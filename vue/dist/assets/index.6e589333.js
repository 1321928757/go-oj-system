import{d as P,p as q,s as u,r as h,G as N,o as n,j as o,h as s,A as b,F as f,k,g as c,H as U,l as I,t as v,v as j,w as A,u as E,I as G,J as H}from"./vendor.e61da12b.js";import{a as B}from"./api.03f0bf99.js";import{_ as J}from"./plugin-vue_export-helper.21dcd24c.js";const R={class:"ques-list"},T={class:"sort-list"},K=I(" \u95EE\u9898\u5206\u7C7B\uFF1A "),M=["onClick"],O={class:"list"},Q={class:"title"},W=["onClick"],X={class:"sort"},Y={key:0},Z={class:"msg"},ee={class:"edit"},te={class:"pagi"},ae=P({setup(se){const m=q(),_=u(!1),y=u([]),F=u([]),g=u(10),C=u(1),x=u(0),d=u(null),p=u(""),L=t=>{i(d.value)},D=t=>{i(d.value)},i=(t,a)=>{d.value=t,_.value=!0,B.getProblemList({category:a,pageSize:g.value,page:C.value,keyword:p.value}).then(l=>{_.value=!1,l&&l.data&&l.data.code==200&&(y.value=l.data.data.page_list,x.value=l.data.data.count),console.log(l)})};i(null),(()=>{B.getSortList({pageSize:1e3,page:1,keyword:p.value}).then(t=>{t&&t.data&&t.data.code==200&&(F.value=t.data.data.page_list)})})();const z=t=>{m.push({path:"/questionDetail",query:t})},w=t=>{m.push({path:"/submitList",query:{identity:t.identity}})};return(t,a)=>{const l=h("el-input"),S=h("el-icon"),V=h("el-pagination"),$=N("loading");return n(),o("div",R,[s("div",T,[s("div",null,[K,s("span",{onClick:a[0]||(a[0]=e=>i(null)),class:b(d.value?"":"act")},"\u5168\u90E8",2),(n(!0),o(f,null,k(F.value,e=>(n(),o("span",{key:e.id,onClick:r=>i(e.id,e.name),class:b(d.value==e.id?"act":"")},v(e.name),11,M))),128))]),c(l,{style:{width:"200px","margin-right":"10px"},modelValue:p.value,"onUpdate:modelValue":a[1]||(a[1]=e=>p.value=e),clearable:"",onChange:a[2]||(a[2]=e=>i(d.value)),onClear:a[3]||(a[3]=e=>i(null)),size:"large",placeholder:"\u8BF7\u641C\u7D22","suffix-icon":t.Search},null,8,["modelValue","suffix-icon"])]),U((n(),o("div",O,[(n(!0),o(f,null,k(y.value,e=>(n(),o("div",{class:"item",key:e.id},[s("div",null,[s("div",Q,[s("b",{onClick:r=>z(e)},v(e.title),9,W),s("div",X,[(n(!0),o(f,null,k(e.problem_categories,r=>(n(),o("span",{key:r.id},[r.category_basic?(n(),o("b",Y,v(r.category_basic.name),1)):j("",!0)]))),128))])]),s("div",Z,[s("span",null,"\u521B\u5EFA\u65F6\u95F4\uFF1A"+v(e.created_at),1),s("span",null,"\u63D0\u4EA4\u4EBA\u6570\uFF1A"+v(e.submit_num),1),s("span",null,"\u901A\u8FC7\u4EBA\u6570\uFF1A"+v(e.pass_num),1)])]),s("div",ee,[c(S,{onClick:r=>z(e),title:"\u8BE6\u60C5"},{default:A(()=>[c(E(G))]),_:2},1032,["onClick"]),c(S,{title:"\u63D0\u4EA4\u5217\u8868",onClick:r=>w(e)},{default:A(()=>[c(E(H))]),_:2},1032,["onClick"])])]))),128))])),[[$,_.value]]),s("div",te,[c(V,{currentPage:C.value,"onUpdate:currentPage":a[4]||(a[4]=e=>C.value=e),"page-size":g.value,"onUpdate:page-size":a[5]||(a[5]=e=>g.value=e),"page-sizes":[10,20,50,100],layout:"total,sizes, prev, pager, next",total:x.value,onSizeChange:L,onCurrentChange:D},null,8,["currentPage","page-size","total"])])])}}});var ie=J(ae,[["__scopeId","data-v-364513ae"]]);export{ie as default};