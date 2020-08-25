import Vue from 'vue';
Vue.filter('formatDate', function(value, fmt) {
  console.log(value);
  let getDate = new Date(value);
  let o = {
    'M+': getDate.getMonth() + 1,
    'd+': getDate.getDate(),
    'h+': getDate.getHours(),
    'm+': getDate.getMinutes(),
    's+': getDate.getSeconds(),
    'q+': Math.floor((getDate.getMonth() + 3) / 3),
    'S': getDate.getMilliseconds()
  };
  if (/(y+)/.test(fmt)) {
    fmt = fmt.replace(RegExp.$1, (getDate.getFullYear() + '').substr(4 - RegExp.$1.length));
  }
  for (let k in o) {
    if (new RegExp('(' + k + ')').test(fmt)) {
      fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)));
    }
  }
  return fmt;
});

Vue.filter('change', {
  read: function(value) { // model -> view 在更新 `<input>` 元素之前格式化值
    return value;
  },
  write: function(newVal, oldVal) { // view -> model  在写回数据之前格式化值
    console.log('newVal:' + newVal);
    console.log('oldVal:' + oldVal);
    return newVal;
  }
});
