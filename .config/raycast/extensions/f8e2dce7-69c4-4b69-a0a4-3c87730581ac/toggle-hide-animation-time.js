"use strict";var m=Object.defineProperty;var d=Object.getOwnPropertyDescriptor;var u=Object.getOwnPropertyNames;var g=Object.prototype.hasOwnProperty;var p=(e,t)=>{for(var i in t)m(e,i,{get:t[i],enumerable:!0})},f=(e,t,i,o)=>{if(t&&typeof t=="object"||typeof t=="function")for(let a of u(t))!g.call(e,a)&&a!==i&&m(e,a,{get:()=>t[a],enumerable:!(o=d(t,a))||o.enumerable});return e};var h=e=>f(m({},"__esModule",{value:!0}),e);var w={};p(w,{default:()=>T});module.exports=h(w);var c=require("child_process"),n=require("@raycast/api");var s=require("@raycast/api"),r=e=>!(e!=null&&String(e).length>0),l=(e,t)=>{let i=new s.Cache({namespace:"Args"});if(typeof e<"u")return i.set(t,e),e;{let o=i.get(t);return typeof o<"u"?o:""}};var T=async e=>{await(0,n.closeMainWindow)(),await(0,n.showToast)({title:"Toggling hide animation time",style:n.Toast.Style.Animated});let t=l(e.arguments.delay,"HideAnimationTime"),i=r(t)?0:parseFloat(t);(0,c.spawnSync)(`defaults write com.apple.dock "autohide-time-modifier" -float "${i}" && killall Dock`,{shell:!0});let o=i===0?"\u{1F4BB} Turn off hide animation time":`\u{1F4BB} Set hide animation time to ${i}s`;await(0,n.showHUD)(o)};
