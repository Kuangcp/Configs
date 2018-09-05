// ==UserScript==
// @name     Common
// @version  1
// @grant    none
// ==/UserScript==

console.log("start load myth js")

function setInputWhiteBG(){
  var inputs = document.getElementsByTagName("input");
  if (inputs == null){
    return;
  }
  for (var i=0; i< inputs.length; i++){
    inputs[i].style.backgroundColor="#FFFFFF"
    inputs[i].style.color="#000000"
  }
}

setInputWhiteBG()

console.log("load successful")
