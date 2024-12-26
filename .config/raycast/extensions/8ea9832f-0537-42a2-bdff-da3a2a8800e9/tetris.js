var J=Object.defineProperty;var K=Object.getOwnPropertyDescriptor;var X=Object.getOwnPropertyNames;var F=Object.prototype.hasOwnProperty;var H=(f,h)=>{for(var o in h)J(f,o,{get:h[o],enumerable:!0})},_=(f,h,o,N)=>{if(h&&typeof h=="object"||typeof h=="function")for(let m of X(h))!F.call(f,m)&&m!==o&&J(f,m,{get:()=>h[m],enumerable:!(N=K(h,m))||N.enumerable});return f};var q=f=>_(J({},"__esModule",{value:!0}),f);var Q={};H(Q,{default:()=>$});module.exports=q(Q);var i=require("react"),s=require("@raycast/api");function $(){let f=()=>Array(22).fill().map(()=>Array(10).fill(0)),h={cw:t=>t[0].map((r,e)=>t.map(n=>n[e]).reverse()),ccw:t=>t[0].map((r,e)=>t.map(n=>n[n.length-1-e]))},o={PLAYING:"playing",PAUSED:"paused",LOSE:"lose"},N=[0];for(let t=1;t<=15;t++)N.push(Math.round((.05+(t-1)*(.25-.05)/14)*100)/100);let m=[[[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0]],[[1,0,0],[1,1,1],[0,0,0]],[[0,0,1],[1,1,1],[0,0,0]],[[1,1],[1,1]],[[0,1,1],[1,1,0],[0,0,0]],[[0,1,0],[1,1,1],[0,0,0]],[[1,1,0],[0,1,1],[0,0,0]]],p=(0,i.useRef)(JSON.parse(JSON.stringify(m)));(0,i.useEffect)(()=>{for(let t=p.current.length-1;t>0;t--){let r=Math.floor(Math.random()*(t+1));[p.current[t],p.current[r]]=[p.current[r],p.current[t]]}},[]);let d=(0,i.useRef)(f()),k=()=>{let t=p.current.shift();if(p.current.length===1){let r=JSON.parse(JSON.stringify(m));for(let e=r.length-1;e>0;e--){let n=Math.floor(Math.random()*(e+1));[r[e],r[n]]=[r[n],r[e]]}p.current=r}return{x:t.length===2?4:3,y:0,shape:t}},[I,y]=(0,i.useState)(()=>k()),[P,v]=(0,i.useState)(f()),[U,L]=(0,i.useState)(""),O=(0,i.useRef)(200),[E,A]=(0,i.useState)(0),[b,M]=(0,i.useState)(0),[w,G]=(0,i.useState)(15),u=(0,i.useRef)(o.PLAYING);(0,i.useEffect)(()=>{G(Math.floor(b/10)+1)},[E]),(0,i.useEffect)(()=>{let t=60,r=1e3/(N[w]*t);O.current=r},[w]);let[D,j]=(0,i.useState)(0);(0,i.useEffect)(()=>{setTimeout(()=>{R()},O.current),j(Date.now())},[]);let z=()=>{let t=d.current,r=0;for(let e=0;e<t.length;e++)t[e].every(n=>n===1)&&(t.splice(e,1),t.unshift(new Array(10).fill(0)),r++);switch(M(e=>e+=r),r){case 1:A(e=>e+100*w);break;case 2:A(e=>e+300*w);break;case 3:A(e=>e+500*w);break;case 4:A(e=>e+800*w);break;default:break}},[V,Y]=(0,i.useState)(!0),R=()=>{u.current===o.PLAYING&&(Y(!0),y(t=>{if(g({...t,y:t.y+1})){if(t.y===0)return s.environment.textSize==="medium"?L(`
  \`\`\`       
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502        GAME        \u2502    PRESS ENTER
  \u2502        OVER        \u2502    TO RESTART
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502
  \u2502                    \u2502 
  \`\`\`
              `):L(`
  \`\`\`
  
  \u2502          \u2502
  \u2502          \u2502
  \u2502          \u2502
  \u2502          \u2502
  \u2502   GAME   \u2502   PRESS ENTER
  \u2502   OVER   \u2502   TO RESTART
  \u2502          \u2502
  \u2502          \u2502
  \u2502          \u2502
  \u2502          \u2502
  \u2570\u2500\u2500TETRIS\u2500\u2500\u256F
  \`\`\`
              `),u.current=o.LOSE,t;{let r=JSON.parse(JSON.stringify(d.current)),{x:e,y:n,shape:l}=t;for(let c=0;c<l.length;c++)for(let S=0;S<l[0].length;S++)l[c][S]!==0&&r[n+c]&&(r[n+c][e+S]=l[c][S]);d.current=r;let a=k();return z(),a}}else{let r=JSON.parse(JSON.stringify(t));return r.y++,r}})),u.current===o.PLAYING?setTimeout(()=>{R()},O.current):Y(!1)};(0,i.useEffect)(()=>{u.current===o.PLAYING&&!V&&R()},[u.current]);let g=(t=I)=>{let{shape:r,x:e,y:n}=t;for(let l=0;l<r.length;l++)for(let a=0;a<r[0].length;a++)if(r[l][a]!==0){let c=n+l,S=e+a;if(!(d.current[c]!==void 0&&d.current[c][S]!==void 0&&d.current[c][S]===0))return!0}return!1};function C(t){var r=Math.floor(t/1e3),e=Math.floor(r/60),n=r%60,l=(e<10?"0":"")+e+":"+(n<10?"0":"")+n;return l}let B=()=>{if(s.environment.textSize==="medium"){let t=[];for(let e=1;e<P.length;e+=1){let n="";for(let l=0;l<P[e].length;l++)n+=P[e][l]===0?"  ":"\u2588\u2588";e===0?t.push([" "+n+" "]):e===3?t.push(["\u2502"+n+"\u2502 NEXT:"]):e===9?t.push(["\u2502"+n+`\u2502 LVL:    ${w} `]):e===10?t.push(["\u2502"+n+`\u2502 TIME:   ${C(Date.now()-D)}`]):e===11?t.push(["\u2502"+n+`\u2502 LINES:  ${String(b).padStart(6,"0")}`]):e===12?t.push(["\u2502"+n+`\u2502 POINTS: ${String(E).padStart(6,"0")} `]):t.push(["\u2502"+n+"\u2502"])}let r=structuredClone(p.current[0]);r.length===3&&r.push(new Array(r[0].length).fill(0));for(let e=0;e<r.length;e++){t[e+3]+=" ";for(let n=0;n<r[e].length;n++)t[e+3]+=r[e][n]===1?"\u2588\u2588":"  "}return t.join(`
`)+`
`}else{let t=[];for(let e=0;e<P.length/2;e+=1){let n=P.slice(e*2,e*2+2),l="";for(let a=0;a<P[0].length;a++){let c={"00":" ","01":"\u2584",10:"\u2580",11:"\u2588"},S=[n[0][a],n[1][a]].join("");l+=c[S]}e===0?t.push([" "+l]):e===1?t.push(["\u2502"+l+"\u2502 NEXT:"]):e===7?t.push(["\u2502"+l+`\u2502 LVL:    ${w}`]):e===8?t.push(["\u2502"+l+`\u2502 TIME:   ${C(Date.now()-D)}`]):e===9?t.push(["\u2502"+l+`\u2502 LINES:  ${String(b).padStart(6,"0")}`]):e===10?t.push(["\u2502"+l+`\u2502 POINTS: ${String(E).padStart(6,"0")}`]):t.push(["\u2502"+l+"\u2502"])}let r=structuredClone(p.current[0]);r.length===3&&r.push(new Array(r[0].length).fill(0));for(let e=0;e<r.length/2;e++){t[e+2]+=" ";let n=r.slice(e*2,e*2+2);for(let l=0;l<r[e].length;l++){let a={"00":" ","01":"\u2584",10:"\u2580",11:"\u2588"},c=[n[0][l],n[1][l]].join("");t[e+2]+=a[c]}}return t.push("\u2570\u2500\u2500TETRIS\u2500\u2500\u256F"),t.join(`
`)+`
`}};(0,i.useEffect)(()=>{let t=JSON.parse(JSON.stringify(d.current)),{x:r,y:e,shape:n}=I;for(let l=0;l<n.length;l++)for(let a=0;a<n[0].length;a++)n[l][a]!==0&&(t[e+l][r+a]=n[l][a]);v(t)},[I,d]),(0,i.useEffect)(()=>{L(t=>`\`\`\`${B(t)}\`\`\``)},[P]);let T=t=>{switch(t){case"d":y(r=>{if(!g({...r,x:r.x+1})){let e=JSON.parse(JSON.stringify(r));return e.x++,e}return r});break;case"a":y(r=>{if(!g({...r,x:r.x-1})){let e=JSON.parse(JSON.stringify(r));return e.x--,e}return r});break;case"w":y(r=>{if(!g({...r,shape:h.cw(r.shape)})){let e=JSON.parse(JSON.stringify(r));return e.shape=h.cw(r.shape),e}return r});break;case"s":y(r=>{if(!g({...r,y:r.y+1})){let e=JSON.parse(JSON.stringify(r));return e.y+=1,e}return r});break;case" ":y(r=>{let e=0;for(;!g({...r,y:r.y+e});)e+=1;let n=JSON.parse(JSON.stringify(r));return n.y+=e-1,n});break;default:return}},[W,x]=(0,i.useState)("game");return _jsx(s.List,{searchText:"",searchBarPlaceholder:"Focus your cursor here...",onSearchTextChange:t=>{T(t)},isShowingDetail:!0,selectedItemId:W,onSelectionChange:t=>{x(t),t==="help"&&(u.current=o.PAUSED),t==="game"&&(u.current=o.PLAYING)}},_jsx(s.List.Item,{title:"Tetris",id:"game",icon:s.Icon.Play,detail:_jsx(s.List.Item.Detail,{markdown:U}),actions:_jsx(s.ActionPanel,null,_jsx(s.Action,{title:u.current===o.PLAYING?"Pause":"Restart",icon:u.current===o.PLAYING?s.Icon.Pause:s.Icon.RotateClockwise,onAction:()=>{u.current===o.PLAYING?(x("help"),u.current=o.PAUSED):(u.current=o.PLAYING,d.current=f(),y(k()),v(f()),A(0),M(0),j(Date.now()),G(1))}}),_jsx(s.Action,{icon:s.Icon.ArrowLeft,title:"Move Piece Left",shortcut:{modifiers:["shift"],key:"a"},onAction:()=>T("a")}),_jsx(s.Action,{icon:s.Icon.ArrowRight,title:"Move Piece Right",shortcut:{modifiers:["shift"],key:"d"},onAction:()=>T("d")}),_jsx(s.Action,{icon:s.Icon.ArrowDown,title:"Move Piece Down",shortcut:{modifiers:["shift"],key:"s"},onAction:()=>T("s")}),_jsx(s.Action,{icon:s.Icon.RotateClockwise,title:"Rotate Piece",shortcut:{modifiers:["shift"],key:"w"},onAction:()=>T("w")}))}),_jsx(s.List.Item,{icon:s.Icon.Pause,title:"Help / Pause",id:"help",detail:_jsx(s.List.Item.Detail,{markdown:`# Game Paused
Press enter to return to the game.${s.environment.textSize==="large"?`
 > Large text size detected. You may want to use the Small text size for a larger Tetris board.`:""}
# Controls
After focusing your cursor in the top search box, simply use WASD and Space to navigate the piece.
- Using \`A\`/\`D\` moves the piece left or right
- Using \`W\` rotates the piece clockwise
- Using \`S\` moves the piece down
- Space drops the piece completely.
> Key repeats are disabled by default on MacOS. You can either turn them on, or hold \`Shift\` with the respective control to enable repeat.
# Rules
 If you do not know how to play Tetris, read about it on Wikipedia [here](https://en.wikipedia.org/wiki/Tetris).`}),actions:_jsx(s.ActionPanel,null,_jsx(s.Action,{icon:s.Icon.Play,title:"Unpause",onAction:()=>{x("game"),u.current=o.PLAYING}}))}))}
