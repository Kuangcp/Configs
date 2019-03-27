// ==UserScript==
// @name     Common
// @version  1
// @grant    none
// ==/UserScript==

console.log("start load myth js")

function setWhiteBG(tagName){
   var tags = document.getElementsByTagName(tagName);
  if (tags == null){
    return;
  }
  for (var i=0; i< tags.length; i++){
    tags[i].style.backgroundColor="#FFFFFF"
    tags[i].style.color="#000000"
  }
}



setWhiteBG("input")
setWhiteBG("textarea")

// #d4d4d4
document.body.style.backgroundColor="#AAAAAA"
// document.body.style.color="#FFFFFF";

console.log("load successful")


