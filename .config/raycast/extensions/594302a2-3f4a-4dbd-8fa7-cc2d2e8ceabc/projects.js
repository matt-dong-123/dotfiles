"use strict";var c=Object.defineProperty;var d=Object.getOwnPropertyDescriptor;var i=Object.getOwnPropertyNames;var m=Object.prototype.hasOwnProperty;var p=(r,e)=>{for(var t in e)c(r,t,{get:e[t],enumerable:!0})},u=(r,e,t,f)=>{if(e&&typeof e=="object"||typeof e=="function")for(let o of i(e))!m.call(r,o)&&o!==t&&c(r,o,{get:()=>e[o],enumerable:!(f=d(e,o))||f.enumerable});return r};var a=r=>u(c({},"__esModule",{value:!0}),r);var j={};p(j,{default:()=>s});module.exports=a(j);var n=require("@raycast/api"),P=(0,n.getPreferenceValues)().projectsdir;function s(){return(0,n.open)(`${P}`)}
