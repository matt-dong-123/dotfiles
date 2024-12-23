var L=Object.defineProperty;var H=Object.getOwnPropertyDescriptor;var V=Object.getOwnPropertyNames;var W=Object.prototype.hasOwnProperty;var $=(u,s)=>{for(var w in s)L(u,w,{get:s[w],enumerable:!0})},F=(u,s,w,d)=>{if(s&&typeof s=="object"||typeof s=="function")for(let f of V(s))!W.call(u,f)&&f!==w&&L(u,f,{get:()=>s[f],enumerable:!(d=H(s,f))||d.enumerable});return u};var _=u=>F(L({},"__esModule",{value:!0}),u);var x={};$(x,{default:()=>N});module.exports=_(x);var c=require("react"),t=require("@raycast/api"),g=t.environment.textSize==="medium",l=g?18:15,i=g?30:26,j=Array.from({length:l},()=>Array.from({length:i},()=>"  ")),n={UP:"UP",DOWN:"DOWN",LEFT:"LEFT",RIGHT:"RIGHT"},e={START:"START",PLAYING:"PLAYING",GAME_OVER:"GAME_OVER"},y=250;function N(){let[u,s]=(0,c.useState)(j),[w,d]=(0,c.useState)([{row:Math.floor(l/2),col:Math.floor(i/2)},{row:Math.floor(l/2),col:Math.floor(i/2)-1},{row:Math.floor(l/2),col:Math.floor(i/2)-2}]),f=(0,c.useRef)(D([{row:Math.floor(l/2),col:Math.floor(i/2)},{row:Math.floor(l/2),col:Math.floor(i/2)-1},{row:Math.floor(l/2),col:Math.floor(i/2)-2}])),[m,Y]=(0,c.useState)(0),C=(0,c.useRef)(n.RIGHT),A=(0,c.useRef)(n.RIGHT),h=(0,c.useRef)(null),[v,G]=(0,c.useState)(""),[b,I]=(0,c.useState)("game"),[a,O]=(0,c.useState)(e.START);(0,c.useEffect)(()=>{let o=Array.from({length:l},()=>Array.from({length:i},()=>"  "));w.forEach(({row:E,col:T},R)=>{R%2===0?o[E][T]="\u2591\u2591":o[E][T]="\u2592\u2592"});let{row:r,col:P}=f.current;o[r][P]="\u2588\u2588",s(o)},[w]);function p(){d(o=>{A.current=C.current;let r={...o[0]};switch(A.current){case n.UP:r.row--;break;case n.DOWN:r.row++;break;case n.LEFT:r.col--;break;case n.RIGHT:r.col++;break}let P=r.row<0||r.row>=l||r.col<0||r.col>=i,E=o.some((R,M)=>M!==0&&R.row===r.row&&R.col===r.col);if(P||E)return clearInterval(h.current),h.current=null,O(e.GAME_OVER),G(k),o;let T=[r,...o.slice(0,o.length-1)];return r.row===f.current.row&&r.col===f.current.col&&(f.current=D(T),T.push(r),Y(R=>R+100)),T})}(0,c.useEffect)(()=>{if(a===e.START&&G(U),a===e.PLAYING){let o=u.map(r=>"\u2502"+r.join("")+"\u2502");G(g?`
\`\`\`
\u256D\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500RAYCAST ARCADE\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256E
${o.join(`
`)}
\u2570\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2524SCORE: ${(m+"").padStart(6,"0")}\u251C\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256F
\`\`\`
          `:`
\`\`\`
\u256D\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500RAYCAST ARCADE\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256E
${o.join(`
`)}
\u2570\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2524SCORE: ${(m+"").padStart(6,"0")}\u251C\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256F
\`\`\`
          `)}a===e.GAME_OVER&&G(k)},[u,a]);function S(o){let r;switch(o){case"ArrowUp":A.current!==n.DOWN?r=n.UP:r=A.current;break;case"ArrowDown":A.current!==n.UP?r=n.DOWN:r=A.current;break;case"ArrowLeft":A.current!==n.RIGHT?r=n.LEFT:r=A.current;break;case"ArrowRight":A.current!==n.LEFT?r=n.RIGHT:r=A.current;break;default:r=A.current;return}C.current=r}function D(o){let r=[];return u.forEach((P,E)=>{P.forEach((T,R)=>{T==="  "&&!o.some(M=>M.row===E&&M.col===R)&&r.push({row:E,col:R})})}),r[Math.floor(Math.random()*r.length)]}let k=g?`
  \`\`\`
  \u256D\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500RAYCAST ARCADE\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256E
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                         GAME OVER!                         \u2502
  \u2502                  PRESS ENTER TO TRY AGAIN                  \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2570\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2524SCORE: ${(m+"").padStart(6,"0")}\u251C\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256F
  \`\`\`
  `:`
  \`\`\`
\u256D\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500RAYCAST ARCADE\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256E
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                     GAME OVER!                     \u2502
\u2502              PRESS ENTER TO TRY AGAIN              \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2570\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2524SCORE: ${(m+"").padStart(6,"0")}\u251C\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256F
\`\`\`
  `,U=g?`
  \`\`\`
  \u256D\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500RAYCAST ARCADE\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256E
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                       RAYCAST SNAKE.                       \u2502
  \u2502                    PRESS ENTER TO PLAY.                    \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2502                                                            \u2502
  \u2570\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2524SCORE: ${(m+"").padStart(6,"0")}\u251C\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256F
  \`\`\`
  `:`
  \`\`\`
\u256D\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500RAYCAST ARCADE\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256E
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                   RAYCAST SNAKE.                   \u2502
\u2502                PRESS ENTER TO PLAY.                \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2502                                                    \u2502
\u2570\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2524SCORE: ${(m+"").padStart(6,"0")}\u251C\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u2500\u256F
\`\`\`
  `;return _jsx(t.List,{searchText:"",onSearchTextChange:o=>{o==="w"&&S("ArrowUp"),o==="a"&&S("ArrowLeft"),o==="s"&&S("ArrowDown"),o==="d"&&S("ArrowRight")},navigationTitle:"Snake",searchBarPlaceholder:"Focus your cursor here...",isShowingDetail:!0,selectedItemId:b,onSelectionChange:o=>{I(o),o==="help"&&(clearInterval(h.current),h.current=null),o==="game"&&h.current==null&&!(a==e.START||a==e.GAME_OVER)&&(h.current=setInterval(p,y))}},_jsx(t.List.Item,{id:"game",title:"Snake",icon:t.Icon.Play,detail:_jsx(t.List.Item.Detail,{markdown:v}),actions:_jsx(t.ActionPanel,{title:"Game controls"},_jsx(t.Action,{icon:a===e.PLAYING?t.Icon.Pause:e.START?t.Icon.Play:t.Icon.RotateClockwise,title:a===e.PLAYING?"Pause":e.START?"Play":"Replay",onAction:()=>{a===e.PLAYING&&(I("help"),clearInterval(h.current),h.current=null),a===e.GAME_OVER&&(s(Array.from({length:l},()=>Array.from({length:i},()=>"  "))),O(e.PLAYING),Y(0),f.current=D(w),d([{row:Math.floor(l/2),col:Math.floor(i/2)},{row:Math.floor(l/2),col:Math.floor(i/2)-1},{row:Math.floor(l/2),col:Math.floor(i/2)-2}]),C.current=n.RIGHT,A.current=n.RIGHT,h.current=setInterval(p,y)),a===e.START&&(O(e.PLAYING),h.current=setInterval(p,y))}}),_jsx(t.Action,{title:"Up",icon:t.Icon.ArrowUp,shortcut:{modifiers:["shift"],key:"arrowUp"},onAction:()=>S("ArrowUp")}),_jsx(t.Action,{title:"Down",icon:t.Icon.ArrowDown,shortcut:{modifiers:["shift"],key:"arrowDown"},onAction:()=>S("ArrowDown")}),_jsx(t.Action,{title:"Left",icon:t.Icon.ArrowLeft,shortcut:{modifiers:["shift"],key:"arrowLeft"},onAction:()=>S("ArrowLeft")}),_jsx(t.Action,{title:"Right",icon:t.Icon.ArrowRight,shortcut:{modifiers:["shift"],key:"arrowRight"},onAction:()=>S("ArrowRight")}))}),_jsx(t.List.Item,{id:"help",icon:t.Icon.Pause,title:"Help / Pause",detail:_jsx(t.List.Item.Detail,{markdown:`# \u23F8 GAME PAUSED 
 # Intro
Welcome to Snake, in Raycast Arcade. Your goal is to eat the apples (fully filled in squares) for 100 points each, but you cannot touch the walls or yourself. If you do, it's game over. 
 # Controls 
 In order to play, make sure you focus your cursor on the top search bar, and use WASD to navigate your Snake. You can also use the arrow keys, but you're going to have to include Shift as a modifier while using arrows.`}),actions:_jsx(t.ActionPanel,{title:"Game Controls"},_jsx(t.Action,{icon:t.Icon.Play,title:a===e.PLAYING?"Unpause":"Return to Game",onAction:()=>{a===e.START&&I("game"),a===e.PLAYING&&(I("game"),h.current=setInterval(p,y)),a===e.GAME_OVER&&I("game")}}))}))}
