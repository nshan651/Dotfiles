(function(e){var o={};function n(t){if(o[t])return o[t].exports;var i=o[t]={i:t,l:!1,exports:{}};return e[t].call(i.exports,i,i.exports,n),i.l=!0,i.exports}return n.m=e,n.c=o,n.d=function(t,i,s){n.o(t,i)||Object.defineProperty(t,i,{enumerable:!0,get:s})},n.r=function(t){typeof Symbol!="undefined"&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,i){if(i&1&&(t=n(t)),i&8||i&4&&typeof t=="object"&&t&&t.__esModule)return t;var s=Object.create(null);if(n.r(s),Object.defineProperty(s,"default",{enumerable:!0,value:t}),i&2&&typeof t!="string")for(var f in t)n.d(s,f,function(r){return t[r]}.bind(null,f));return s},n.n=function(t){var i=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(i,"a",i),i},n.o=function(t,i){return Object.prototype.hasOwnProperty.call(t,i)},n.p="",n(n.s=698)})({16:function(e,o,n){"use strict";n.d(o,"b",function(){return t}),n.d(o,"d",function(){return i}),n.d(o,"g",function(){return s}),n.d(o,"i",function(){return f}),n.d(o,"h",function(){return r}),n.d(o,"j",function(){return d}),n.d(o,"k",function(){return c}),n.d(o,"c",function(){return u}),n.d(o,"m",function(){return E}),n.d(o,"l",function(){return l}),n.d(o,"p",function(){return O}),n.d(o,"o",function(){return T}),n.d(o,"n",function(){return S}),n.d(o,"t",function(){return I}),n.d(o,"r",function(){return a}),n.d(o,"s",function(){return R}),n.d(o,"u",function(){return m}),n.d(o,"v",function(){return N}),n.d(o,"w",function(){return M}),n.d(o,"x",function(){return g}),n.d(o,"e",function(){return A}),n.d(o,"a",function(){return C}),n.d(o,"q",function(){return L}),n.d(o,"f",function(){return D});const t="allow-loom-urls",i="disallow-loom-urls",s="get-cam-permission",f="get-mic-permission",r="get-mic-and-cam-permissions",d="get-session-details",c="get-session-details-from-alias-id",u="check-content-connection",E="inject-intercom-link-expand-script",l="initiate-loom-recorder-from-script",O="open-gmail-integration-walkthrough-from-gmail-composer",T="log-exception",S="log-crumb",I="request-tab-id",a="request-active-tab",R="request-devices",m="request-thumb-exists",N="track-event",M="update-integration-settings",g="user-login",A="extension-clicked",C="add-log-entry",L="loom-recording-started",D="fetch-camfort-thumbnail"},177:function(e,o,n){(function(t){(typeof window!="undefined"?window:typeof t!="undefined"?t:typeof self!="undefined"?self:{}).SENTRY_RELEASE={id:"5.3.2"}}).call(this,n(43))},43:function(e,o){var n;n=function(){return this}();try{n=n||new Function("return this")()}catch(t){typeof window=="object"&&(n=window)}e.exports=n},698:function(e,o,n){n(177),e.exports=n(699)},699:function(e,o,n){"use strict";n.r(o);var t=n(16);const i="PermissionDismissedError",s="DevicesNotFoundError";function f(){window.navigator.webkitGetUserMedia({audio:!0,video:!0},r=>{const d=r.getTracks();let c=!1,u=!1;d.forEach(E=>{E.stop();const l=E.kind;c=c||l==="audio",u=u||l==="video"}),c&&u?window.top.postMessage({accessGranted:!0,type:"mic-and-cam",micsAvailable:c,camerasAvailable:u},"*"):window.top.postMessage({accessGranted:!1,type:"mic-and-cam",micsAvailable:c,camerasAvailable:u},"*")},r=>{const d=r.name===i?null:!1,c=r.name===s;window.top.postMessage({accessGranted:d,type:"mic-and-cam",deviceUnavailable:c},"*")})}window.addEventListener("message",r=>{switch(r.data.type){case t.h:f();break;default:break}},!1)}});
