import Vue from 'vue';
/**
 * sessionStorage操作
 * @type {Object}
 */
Vue.prototype.storage = {
  get(key) {
    return null || sessionStorage.getItem(key);
  },
  remove(key) {
    if (!key) return;
    window.sessionStorage.removeItem(key);
  },
  watch(key, callback) {
    window.addEventListener('storage', (e) => {
      callback(this.get(key));
    });
    window.addEventListener('setItem', (e) => {
      callback(this.get(key));
    });
  },
  set(key, newVal) {
    // 创建一个StorageEvent事件
    var newStorageEvent = document.createEvent('StorageEvent');
    const storage = {
      setItem: function(k, val) {
        window.sessionStorage.setItem(k, val);
        // 初始化创建的事件
        newStorageEvent.initStorageEvent('setItem', false, false, k, null, val, null, null);
        // 派发对象
        window.dispatchEvent(newStorageEvent);
      }
    };
    return storage.setItem(key, newVal);
  }
};
/**
 * 服务组
 * @return {[type]} [description]
 */
Vue.prototype.$service = function() {
  let vm = this;
  let defaults = {};
  /**
   * 初始化获取微信code
   * @return {[type]} [description]
   */
  defaults.initWX = function() {
    let appid = vm.$store.state.appId;
    let redirect = encodeURIComponent(window.location.href.split('?')[0]);
    // let scope = 'snsapi_base';
    let scope = 'snsapi_userinfo';
    let url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid=' + appid + '&redirect_uri=' + redirect + '&response_type=code&scope=' + scope + '&connect_redirect=1#wechat_redirect';
    window.location.href = url;
  };
  /**
   * 微信openId登录
   * @return {[type]} [description]
   */

  defaults.openIdLogin = function() {
    return new Promise(function(resolve, reject) {
      if (vm.$route.query.code == undefined) {
        defaults.initWX();
      } else {
        vm.loadingshow = vm.postJson('/coupon/wxUser/openIdLogin?scope=snsapi_userinfo&code=' + vm.$route.query.code, {}, function(res) {
          resolve(res);
          vm.$store.dispatch('setUserInfo', {
            phone: res.data.wxUser.phone,
            openid: res.data.userInfo.openid
          });
        }, function(res) {
          if (res.code == 501) {
            defaults.initWX();
          } else {
            vm.isStatus = true;
            vm.$store.dispatch('setOpenId', res.data.userInfo.openid);
            reject(res);
          }
        });
      }
    });
  };
  return defaults;
};
