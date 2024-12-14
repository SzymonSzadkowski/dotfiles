"use strict";var m=Object.defineProperty;var h=Object.getOwnPropertyDescriptor;var S=Object.getOwnPropertyNames;var T=Object.prototype.hasOwnProperty;var y=(e,t)=>{for(var r in t)m(e,r,{get:t[r],enumerable:!0})},w=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let i of S(t))!T.call(e,i)&&i!==r&&m(e,i,{get:()=>t[i],enumerable:!(n=h(t,i))||n.enumerable});return e};var P=e=>w(m({},"__esModule",{value:!0}),e);var O={};y(O,{default:()=>M});module.exports=P(O);var s=require("@raycast/api");var u=require("@raycast/api");var a=require("fs"),d=require("path");var l=e=>(e.d1=e.d1=="----"?void 0:e.d1,e.d2=e.d2=="----"?void 0:e.d2,Math.round((e.d1?new Date(e.d1):new Date).getTime()-(e.d2?new Date(e.d2):new Date).getTime())/1e3);var o=require("@raycast/api");var J=u.environment.supportPath+"/customTimers.json",R=u.environment.supportPath+"/defaultPresetVisibles.json",f=e=>{try{(0,a.unlinkSync)(e)}catch(t){if(t instanceof Error&&!t.message.includes("ENOENT"))throw t}};function g(e){let t=u.environment.supportPath+"/"+e,r=t.replace(".timer",".dismiss");f(t),f(r)}function p(){let e=[];return(0,a.readdirSync)(u.environment.supportPath).forEach(r=>{if((0,d.extname)(r)==".timer"){let n={name:"",secondsSet:-99,timeLeft:-99,originalFile:r,timeEnds:new Date};n.name=(0,a.readFileSync)(u.environment.supportPath+"/"+r).toString();let i=r.split("---");n.secondsSet=Number(i[1].split(".")[0]);let c=i[0].replace(/__/g,":");n.timeLeft=Math.max(0,Math.round(n.secondsSet-l({d2:c}))),n.timeEnds=new Date(c),n.timeEnds.setSeconds(n.timeEnds.getSeconds()+n.secondsSet),e.push(n)}}),e.sort((r,n)=>r.timeLeft-n.timeLeft),e}var M=async()=>{if(!(0,s.getPreferenceValues)().ringContinuously)return await(0,s.showToast)({style:s.Toast.Style.Failure,title:"Ring Continuously setting not enabled!"});let e=p().filter(t=>t.timeLeft===0);if(e.length===0)return await(0,s.showToast)({style:s.Toast.Style.Failure,title:"No finished timers found!"});await(0,s.closeMainWindow)(),g(e[0].originalFile)};
