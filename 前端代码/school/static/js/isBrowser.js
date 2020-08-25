/**
 * 判断浏览器
 * @return {Boolean} [description]
 */
function isBrowser() {
  var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串  
  var agentLowerCase = userAgent.toLowerCase();
  var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1; //判断是否IE<11浏览器  
  var isIE11 = userAgent.indexOf('Trident') > -1 && userAgent.indexOf("rv:11.0") > -1;
  if (isIE) {
    var reIE = new RegExp("MSIE (\\d+\\.\\d+);");
    reIE.test(userAgent);
    var ieVersion = parseFloat(RegExp["$1"]);
    if (ieVersion == 7) {
      return 7;
    } else if (ieVersion == 8) {
      return 8;
    } else if (ieVersion == 9) {
      return 9;
    } else if (ieVersion == 10) {
      return 10;
    } else {
      return 6; // IE版本<=7
    }
  } else if (isIE11) {
    return 11; // IE11  
  } else {
    if (userAgent.indexOf("Firefox") >= 0) {
      var regFF = /firefox\/[\d]+/gi;
      var ff = agentLowerCase.match(regFF)[0].split('/')[1];
      if (ff < 50) {
        return 1;
      } else {
        return -1;
      }
    } else if (userAgent.indexOf("Chrome") >= 0) {
      var regChrome = /chrome\/[\d]+/gi;
      var chrome = agentLowerCase.match(regChrome)[0].split('/')[1];
      if (chrome < 50) {
        return 1;
      } else {
        return -1;
      }
    } else {
      return -1; // 不是IE浏览器
    }
  }
}
