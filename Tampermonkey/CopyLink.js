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
  let Container = document.createElement("div");
  Container.id = "md-link-copier";
  Container.style.position = "fixed";
  Container.style.left = "1vw";
  Container.style.top = "90vh";
  Container.style["z-index"] = "999999";
  Container.innerHTML = `<button id="copy-link-btn" style="position:absolute; left:30px; top:20px; background-color:#7597de;border-radius: 1px;border: none;padding: 3px;"> Link </button>`;

  let append = false;
  Container.addEventListener("click", function () {
    if (!append) {
      let txtDiv = document.createElement("input");
      txtDiv.id = "tmp-text";
      txtDiv.style["z-index"] = "-999999";
      //txtDiv.style.display = "none";
      let link = "> [" + document.title + "](" + document.location.href + ")  ";
      txtDiv.value = link;
      // console.log(link);
      document.body.appendChild(txtDiv);
      append = true;
    }

    const input = document.querySelector("#tmp-text");
    // console.log(input);
    input.select();
    document.execCommand("copy");

    Container.innerHTML = `<button id="copy-link-btn" style="position:absolute; left:30px; top:20px; background-color:#e67e22;border-radius: 1px;border: none;padding: 3px;"> Link </button>`;
  });

  document.body.appendChild(Container);
})();
