var T=Object.create;var E=Object.defineProperty;var V=Object.getOwnPropertyDescriptor;var Y=Object.getOwnPropertyNames;var X=Object.getPrototypeOf,D=Object.prototype.hasOwnProperty;var J=(r,o)=>()=>(o||r((o={exports:{}}).exports,o),o.exports),H=(r,o)=>{for(var e in o)E(r,e,{get:o[e],enumerable:!0})},$=(r,o,e,t)=>{if(o&&typeof o=="object"||typeof o=="function")for(let l of Y(o))!D.call(r,l)&&l!==e&&E(r,l,{get:()=>o[l],enumerable:!(t=V(o,l))||t.enumerable});return r};var q=(r,o,e)=>(e=r!=null?T(X(r)):{},$(o||!r||!r.__esModule?E(e,"default",{value:r,enumerable:!0}):e,r)),z=r=>$(E({},"__esModule",{value:!0}),r);var F=J((B,N)=>{N.exports=function(r){var o={};function e(t){if(o[t])return o[t].exports;var l=o[t]={i:t,l:!1,exports:{}};return r[t].call(l.exports,l,l.exports,e),l.l=!0,l.exports}return e.m=r,e.c=o,e.d=function(t,l,g){e.o(t,l)||Object.defineProperty(t,l,{enumerable:!0,get:g})},e.r=function(t){typeof Symbol<"u"&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},e.t=function(t,l){if(1&l&&(t=e(t)),8&l||4&l&&typeof t=="object"&&t&&t.__esModule)return t;var g=Object.create(null);if(e.r(g),Object.defineProperty(g,"default",{enumerable:!0,value:t}),2&l&&typeof t!="string")for(var A in t)e.d(g,A,function(v){return t[v]}.bind(null,A));return g},e.n=function(t){var l=t&&t.__esModule?function(){return t.default}:function(){return t};return e.d(l,"a",l),l},e.o=function(t,l){return Object.prototype.hasOwnProperty.call(t,l)},e.p="",e(e.s=0)}([function(r,o,e){let{exec:t}=e(1),l=e(2).promisify(t);r.exports={play:async(g,A=.5)=>{let v=process.platform==="darwin"?Math.min(2,2*A):A,h=process.platform==="darwin"?((M,j)=>`afplay "${M}" -v ${j}`)(g,v):((M,j)=>`powershell -c Add-Type -AssemblyName presentationCore; $player = New-Object system.windows.media.mediaplayer; ${(O=>`$player.open('${O}');`)(M)} $player.Volume = ${j}; $player.Play(); Start-Sleep 1; Start-Sleep -s $player.NaturalDuration.TimeSpan.TotalSeconds;Exit;`)(g,v);try{await l(h)}catch(M){throw M}}}},function(r,o){r.exports=require("child_process")},function(r,o){r.exports=require("util")}])});var U={};H(U,{default:()=>I});module.exports=z(U);var m=require("@raycast/api"),y=require("react"),k=q(F());function I(){let r={PLAYING:"playing",GAMEOVER:"gameover"},o=p=>{k.default.play(m.environment.assetsPath+"/sfx/"+p)},e=[`
  \u2584\u2588\u2584
\u2588 \u2588\u2588\u2588
\u2580\u2580\u2588\u2588\u2588
   \u2588\u2588`,`
\u2584\u2588\u2584  
\u2588\u2588\u2588 \u2588
\u2588\u2588\u2588\u2580\u2580
\u2588\u2588\u2588  `,`
\u2588\u2588   
\u2588\u2588\u2588 \u2588
\u2588\u2588\u2588\u2580\u2580
\u2588\u2588   `,`
  \u2588\u2588   
\u2588 \u2588\u2588\u2588
\u2580\u2580\u2588\u2588\u2588
   \u2588\u2588`,`
     \u2588  
\u2588\u2588 \u2580\u2588\u2588 
\u2588\u2588\u2580 \u2588\u2588\u2580
\u2588\u2588  \u2588\u2588 `],t=[`
   \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
  \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591`,`
  \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591`,`
 \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
    \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591`,`
    \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
   \u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591
\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591\u2591`],l=[`
        \u2584\u2588\u2580\u2588\u2588\u2588\u2588\u2584
        \u2588\u2588\u2588\u2588\u2580\u2580\u2580\u2580
   \u2584   \u2584\u2588\u2588\u2580\u2580\u2580\u2580\u2580 
   \u2580\u2588\u2584\u2588\u2588\u2588\u2588\u2584     
    \u2580\u2588\u2588\u2588\u2588\u2580      
     \u2588\u2584 \u2580\u2580      `,`
        \u2584\u2588\u2580\u2588\u2588\u2588\u2588\u2584
        \u2588\u2588\u2588\u2588\u2580\u2580\u2580\u2580
   \u2584   \u2584\u2588\u2588\u2580\u2580\u2580\u2580\u2580 
   \u2580\u2588\u2584\u2588\u2588\u2588\u2588\u2584     
    \u2580\u2588\u2588\u2588\u2588\u2580      
     \u2580\u2580 \u2588\u2584      `],g=`
        \u2584\u2588\u2580\u2588\u2588\u2588\u2588\u2584
        \u2588\u2588\u2588\u2588\u2580\u2580\u2580\u2580
   \u2584   \u2584\u2588\u2588\u2580\u2580\u2580\u2580\u2580 
   \u2580\u2588\u2584\u2588\u2588\u2588\u2588\u2584     
    \u2580\u2588\u2588\u2588\u2588\u2580      
     \u2588\u2584 \u2588\u2584      `,A=`
        \u2584\u2588\u2588\u2588\u2588\u2588\u2588\u2584
        \u2588\u2588X\u2588\u2588\u2588\u2588\u2588
   \u2584   \u2584\u2588\u2588\u2580\u2580\u2580\u2580\u2580 
   \u2580\u2588\u2584\u2588\u2588\u2588\u2588\u2584     
    \u2580\u2588\u2588\u2588\u2588\u2580      
     \u2588\u2584 \u2588\u2584      `,v=`
                  
 G A M E  O V E R 
                  
   \u2584\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2584   
   \u2588\u2588\u2580\u2580\u2580\u2580\u2580\u2580\u2580\u2588\u2588\u2588   
   \u2588\u2588\u2588\u2588\u2580\u2588\u2588\u2588 \u2588\u2588\u2588   
   \u2588\u2588\u2588\u2584 \u2584\u2584\u2584\u2584\u2588\u2588\u2588   
   \u2580\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2588\u2580   
                  
     `,h=m.environment.textSize==="medium"?106:92,M=m.environment.textSize==="medium"?20:17,[j,O]=(0,y.useState)(Array(M).fill().map(()=>Array(h).fill(" "))),x=(0,y.useRef)(r.PLAYING),s=(0,y.useRef)(0),f=(0,y.useRef)({y:0,gravity:0}),P=(0,y.useRef)(!1),S=(0,y.useRef)([]),w=(0,y.useRef)([]),b=(0,y.useRef)(0);function _(p,d){return Math.floor(Math.random()*(d-p+1))+p}(0,y.useEffect)(()=>{P.current||(G(),P.current=!0)},[]);let G=()=>{if(s.current%5===0&&(b.current>0&&b.current%100===0&&o("dinoCoinSFX.mov"),b.current+=1),x.current===r.PLAYING){f.current.y=Math.round(Math.max(f.current.y+f.current.gravity,0)),s.current===60&&S.current.push({x:h,shape:e[Math.floor(Math.random()*e.length)],time:s.current}),s.current>60&&s.current-S.current.at(-1).time>40&&Math.random()<.02&&S.current.push({x:h,shape:e[Math.floor(Math.random()*e.length)],time:s.current}),s.current>60&&s.current-S.current.at(-1).time>100&&S.current.push({x:h,shape:e[Math.floor(Math.random()*e.length)],time:s.current}),s.current%70===0&&w.current.push({x:h,y:_(0,5),shape:t[Math.floor(Math.random()*t.length)]}),f.current.y!==0&&(f.current.gravity-=1/5);let p;f.current.y!==0?p=g.split(`
`).map(n=>n.split("")):p=l[Math.floor(s.current/5)%2].split(`
`).map(n=>n.split(""));let d=Array(M).fill().map(()=>Array(h).fill(" "));d[16]=Array(h).fill("_");for(let n=0;n<S.current.length;n++){let i=S.current[n];i.x-=1+(b.current-10)*.02/10;let a=i.shape.split(`
`).map(u=>u.split(""));for(let u=0;u<a.length;u++)for(let c=0;c<a[u].length;c++)a[u][c+Math.floor(i.x)]!==" "&&c+Math.floor(i.x)>0&&c+Math.floor(i.x)<h-1&&(d[u+12][c+Math.floor(i.x)]=a[u][c]);i.x<-200&&S.current.splice(n,1)}for(let n=0;n<w.current.length;n++){let i=w.current[n];i.x-=.5;let a=i.shape.split(`
`).map(u=>u.split(""));for(let u=0;u<a.length;u++)for(let c=0;c<a[u].length;c++)a[u][c+Math.floor(i.x)]!==" "&&c+Math.floor(i.x)>0&&c+Math.floor(i.x)<h-1&&(d[u+i.y][c+Math.floor(i.x)]=a[u][c]);i.x<-20&&w.current.splice(n,1)}for(let n=0;n<p.length;n++){for(let i=0;i<p[n].length;i++)if(p[n][i]!==" "&&n+-f.current.y+10>0)if(["_"," ","\u2591"].includes(d[n+-f.current.y+10][i]))d[n+-f.current.y+10][i]=p[n][i];else{o("dinoEndSFX.mov"),x.current=r.GAMEOVER;break}if(x.current==r.GAMEOVER)break}if(x.current===r.GAMEOVER){let n=A.split(`
`).map(a=>a.split(""));for(let a=0;a<n.length;a++)for(let u=0;u<n[a].length;u++)n[a][u]!==" "&&a+-f.current.y+10>0&&(d[a+-f.current.y+10][u]=n[a][u]);let i=v.split(`
`).map(a=>a.split(""));for(let a=0;a<i.length;a++)for(let u=0;u<i[a].length;u++)d[a+Math.floor(M/2-i.length/2)][u+Math.floor(h/2-i[a].length/2)]=i[a][u]}let R=`SCORE: ${b.current}`.split("").reverse().join("");for(let n=0;n<R.length;n++)d[1][d[0].length-1-n]=R[n];O(d),s.current++,setTimeout(G,25)}else P.current=!1},C=()=>{f.current.y===0&&(o("dinoJumpSFX.mov"),f.current.gravity=2.25)},L=()=>{x.current===r.PLAYING&&C(),x.current===r.GAMEOVER&&(o("dinoJumpSFX.mov"),s.current=0,f.current={y:0,gravity:0},S.current=[],w.current=[],b.current=0,x.current=r.PLAYING,P.current||(G(),P.current=!0))};return _jsx(m.Detail,{actions:_jsx(m.ActionPanel,null,_jsx(m.Action,{icon:x.current===r.PLAYING?m.Icon.ArrowUp:m.Icon.RotateClockwise,title:x.current===r.PLAYING?"Jump":"Restart",onAction:()=>{L()}})),markdown:`
\`\`\`${j.map(p=>p.join("")).join(`
`)}
\`\`\``})}
