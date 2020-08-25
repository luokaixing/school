// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.

import Vue from 'vue';
import axios from 'axios';

function toFormData(obj) {
  var query = '';
  var name, value, fullSubName, subName, subValue, innerObj, i;

  for (name in obj) {
    value = obj[name];

    if (value instanceof Array) {
      for (i = 0; i < value.length; ++i) {
        subValue = value[i];
        fullSubName = name;
        innerObj = {};
        innerObj[fullSubName] = subValue;
        query += toFormData(innerObj) + '&';
      }
    } else if (value instanceof Object) {
      for (subName in value) {
        subValue = value[subName];
        fullSubName = name + '[' + subName + ']';
        innerObj = {};
        innerObj[fullSubName] = subValue;
        query += toFormData(innerObj) + '&';
      }
    } else if (value !== undefined && value !== null) {
      query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
    }
  }
  return query.length ? query.substr(0, query.length - 1) : query;
}

// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'; // 配置请求头
// axios.defaults.transformRequest = [function (data) {
//   return typeof data === 'object' && String(data) !== '[object File]' ? toFormData(data) : data;
// }];
Vue.prototype.$http = axios;
Vue.prototype.post = function(url, params, successCallback, errorCallback) {
  let vm = this;
  params['random'] = Math.floor(Math.random() * (100000 + 1));
  return new Promise(function(resolve, reject) {
    axios.post(url, params, {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
      transformRequest: [function(data) {
        return typeof data === 'object' && String(data) !== '[object File]' ? toFormData(data) : data;
      }]
    }).then(function(res) {
      return res;
    }).then(function(res) {
      resolve(res.data);
      if (res.data.code == 200) {
        if (params.isMessage) {
          vm.$Message.success(res.data.message);
        }
        successCallback(res.data);
      } else {
        vm.$Message.error(res.data.message);
        if (errorCallback && errorCallback instanceof Function) {
          reject(res);
          errorCallback(res.data.message);
        }
      }
    }, function(err) {
      if (err.response != undefined) {
        if (err.response.data.code == 300) {
          if (vm.$route.path != '/') {
            vm.$Message.error(err.response.data.message);
            vm.$router.push({
              path: '/',
              query: { redirect: vm.$route.path }
            });
          }
        } else if (err.response.data.code == 400) {
          vm.$Message.error(err.response.data.message);
        } else {
          vm.$Message.error('发生错误,请检查网络设置或联系技术人员');
        }
      } else {
        vm.$Message.error('发生错误,请检查网络设置或联系技术人员');
      }
      if (errorCallback && errorCallback instanceof Function) {
        reject(err);
        errorCallback(err);
      }
    });
  });
};

Vue.prototype.get = function(url, params, successCallback, errorCallback) {
  let vm = this;
  params['random'] = Math.floor(Math.random() * (100000 + 1));
  return new Promise(function(resolve, reject) {
    axios.get(url, { params: params }, {
      'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
      transformRequest: [function(data) {
        return typeof data === 'object' && String(data) !== '[object File]' ? toFormData(data) : data;
      }]
    }).then(function(res) {
      return res;
    }).then(function(res) {
      resolve(res.data);
      if (res.data.code == 200) {
        if (params.isMessage) {
          vm.$Message.success(res.data.message);
        }
        successCallback(res.data);
      } else {
        vm.$Message.error(res.data.message);
        if (errorCallback && errorCallback instanceof Function) {
          reject(res);
          errorCallback(res.data.message);
        }
      }
    }, function(err) {
      if (err.response != undefined) {
        if (err.response.data.code == 300) {
          if (vm.$route.path != '/') {
            vm.$Message.error(err.response.data.message);
            vm.$router.push({
              path: '/',
              query: { redirect: vm.$route.path }
            });
          }
        } else {
          vm.$Message.error('发生错误,请检查网络设置或联系技术人员');
        }
      } else if (err.response.data.code == 400) {
        vm.$Message.error(err.response.data.message);
      } else {
        vm.$Message.error('发生错误,请检查网络设置或联系技术人员');
      }
      if (errorCallback && errorCallback instanceof Function) {
        reject(err);
        errorCallback(err);
      }
    });
  });
};

Vue.prototype.postJson = function(url, params, successCallback, errorCallback) {
  let vm = this;
  params['random'] = Math.floor(Math.random() * (100000 + 1));
  return new Promise(function(resolve, reject) {
    axios.post(url, params).then(function(res) {
      return res;
    }).then(function(res) {
      resolve(res.data);
      if (res.data.code == 200) {
        if (params.isMessage) {
          vm.$Message.success(res.data.message);
        }
        successCallback(res.data);
      } else {
        vm.$Message.error(res.data.message);
        if (errorCallback && errorCallback instanceof Function) {
          errorCallback(res.data.message);
        }
      }
    }, function(err) {
      if (err.response.data.code == 300) {
        if (vm.$route.path != '/') {
          vm.$Message.error(err.response.data.message);
          vm.$router.push({
            path: '/',
            query: { redirect: vm.$route.path }
          });
        }
      } else if (err.response.data.code == 400) {
        vm.$Message.error(err.response.data.message);
      } else {
        vm.$Message.error('发生错误,请检查网络设置或联系技术人员');
      }
      if (errorCallback && errorCallback instanceof Function) {
        reject(err);
        errorCallback(err);
      }
    });
  });
};

Vue.prototype.getJson = function(url, params, successCallback, errorCallback) {
  let vm = this;
  params['random'] = Math.floor(Math.random() * (100000 + 1));
  return new Promise(function(resolve, reject) {
    axios.get(url, params).then(function(res) {
      return res;
    }).then(function(res) {
      resolve(res.data);
      if (res.data.code == 200) {
        if (params.isMessage) {
          vm.$Message.success(res.data.message);
        }
        successCallback(res.data);
      } else {
        vm.$Message.error(res.data.message);
        if (errorCallback && errorCallback instanceof Function) {
          errorCallback(res.data.message);
        }
      }
    }, function(err) {
      if (err.response.data.code == 300) {
        if (vm.$route.path != '/') {
          vm.$Message.error(err.response.data.message);
          vm.$router.push({
            path: '/',
            query: { redirect: vm.$route.path }
          });
        }
      } else if (err.response.data.code == 400) {
        vm.$Message.error(err.response.data.message);
      } else {
        vm.$Message.error('发生错误,请检查网络设置或联系技术人员');
      }
      if (errorCallback && errorCallback instanceof Function) {
        reject(err);
        errorCallback(err);
      }
    });
  });
};

Vue.prototype.xml = function(url, params, successCallback, errorCallback) {
  // var vm = this;
  params['random'] = Math.floor(Math.random() * (100000 + 1));
  $.ajax({
    type: 'get',
    url: url,
    data: params,
    dataType: 'xml',
    async: true,
    cache: false,
    timeout: 30000,
    success: function(dataJson) {
      successCallback($(dataJson));
    },
    error: function(errorThrown) {
      errorCallback(errorThrown);
    }
  });
};
