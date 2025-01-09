// ==UserScript==
// @name         CopyLink
// @namespace    http://tampermonkey.net/
// @version      2024-10-10
// @description  复制当前链接为MD
// @author       Mythos
// @match        *://*/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=mubu.com
// @grant        none
// ==/UserScript==

(function () {
  "use strict";

  // iframe 不执行
  if (window !== window.top) {
    return;
  }
  let originBtnH5 = `<button id="copy-link-btn" style="position:absolute; left:30px; top:20px; background-color:#53AD53;border-radius: 8px;border: none;padding: 3px;"> Copy </button>`;
  let clickBtnH5 = `<button id="copy-link-btn" style="position:absolute; left:30px; top:20px; background-color:#2C2E33;border-radius: 8px;border: none;padding: 3px;"> Copied!! </button>`;
  let Container = document.createElement("div");
  Container.id = "md-link-copier";
  Container.style.position = "fixed";
  Container.style.left = "1vw";
  Container.style.top = "90vh";
  Container.style["z-index"] = "999999";
  Container.innerHTML = originBtnH5;

  let append = false;
  Container.addEventListener("click", function () {
    let tid = "tmp-text";
    if (!append) {
      let txtDiv = document.createElement("input");
      txtDiv.id = tid;
      txtDiv.style["z-index"] = "-999999";
      // 隐藏后无法复制,必须要暴露
      // txtDiv.style.display = "none";
      txtDiv.style["border"] = "none";
      txtDiv.style["background"] = "none";

      let link = "> [" + document.title + "](" + document.location.href + ")  ";
      txtDiv.value = link;
      // console.log(link);
      document.body.appendChild(txtDiv);
      append = true;
    } else {
      let txtDiv = document.getElementById(tid);
      let link = "> [" + document.title + "](" + document.location.href + ")  ";
      txtDiv.value = link;
    }

    const input = document.querySelector("#" + tid);
    // console.log(input);
    input.select();
    document.execCommand("copy");

    Container.innerHTML = clickBtnH5;

    function restore() {
      Container.innerHTML = originBtnH5;
    }
    setTimeout(restore, 1800);
  });

  document.body.appendChild(Container);
})();
