"use strict";var a=Object.defineProperty;var g=Object.getOwnPropertyDescriptor;var u=Object.getOwnPropertyNames;var p=Object.prototype.hasOwnProperty;var f=(t,e)=>{for(var o in e)a(t,o,{get:e[o],enumerable:!0})},d=(t,e,o,i)=>{if(e&&typeof e=="object"||typeof e=="function")for(let r of u(e))!p.call(t,r)&&r!==o&&a(t,r,{get:()=>e[r],enumerable:!(i=g(e,r))||i.enumerable});return t};var h=t=>d(a({},"__esModule",{value:!0}),t);var k={};f(k,{default:()=>w});module.exports=h(k);var m=require("child_process"),n=require("@raycast/api");var s=require("@raycast/api"),c=t=>!(t!=null&&String(t).length>0),l=(t,e)=>{let o=new s.Cache({namespace:"Args"});if(typeof t<"u")return o.set(e,t),t;{let i=o.get(e);return typeof i<"u"?i:""}};var w=async t=>{await(0,n.closeMainWindow)(),await(0,n.showToast)({title:"Toggling Dock orientation",style:n.Toast.Style.Animated});let e=l(t.arguments.orientation,"Orientation"),o=c(e)?"bottom":e;(0,m.spawnSync)(`defaults write com.apple.dock orientation ${o} && killall Dock`,{shell:!0}),await(0,n.showHUD)(`\u{1F4BB} Set Dock orientation to ${o}`)};
