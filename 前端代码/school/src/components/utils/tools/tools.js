import Vue from 'vue';
Vue.prototype.copyJSON = oldJson => $.extend(true, {}, oldJson);
Vue.prototype.copy = oldArr => $.extend(true, [], oldArr);
Vue.prototype.extend = (defaults, options) => $.extend(defaults, options);
// 去除空格
Vue.prototype.trim = str => $.trim(str);
// 换行符转换br
Vue.prototype.transferString = str => {
  var string = str;
  try {
    string = string.replace(/\r\n/g, '<br>');
    string = string.replace(/\n/g, '<br>');
  } catch (e) {
    alert(e.message);
  }
  return string;
};
// 是否是iOS
Vue.prototype.isIOS = !!navigator.userAgent.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
// 是否是Android
Vue.prototype.isAndroid = navigator.userAgent.indexOf('Android') > -1 || navigator.userAgent.indexOf('Adr') > -1;
// 判断是否字符
Vue.prototype.isString = val => Object.prototype.toString.call(val) === '[object String]';
// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18

Vue.prototype.formatDate1 = function(dateTime, fmt) {
  var isStr = this.isString(dateTime);
  if (dateTime !== undefined && dateTime !== '' && dateTime !== null) {
    var time = dateTime;
    if (isStr) {
      time = new Date(dateTime.replace(/-/g, '/'));
    } else {
      time = new Date(dateTime);
    }
    var o = {
      'M+': time.getMonth() + 1, // 月份
      'd+': time.getDate(), // 日
      'h+': time.getHours(), // 小时
      'm+': time.getMinutes(), // 分
      's+': time.getSeconds(), // 秒
      'q+': Math.floor((time.getMonth() + 3) / 3), // 季度
      'S': time.getMilliseconds() // 毫秒
    };
    if (/(y+)/.test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (time.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
      if (new RegExp('(' + k + ')').test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
      }
    }
    return fmt;
  } else {
    return '';
  }
};
