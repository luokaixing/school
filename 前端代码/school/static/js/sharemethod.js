var shareWeChat = {
  config: {},
  init(appId, jsapi_ticket) {
    var then = this;
    var url = window.location.href;
    var timestamp = parseInt(new Date().getTime() / 1000) + '';
    var nonceStr = Math.random().toString(36).substr(2, 15);
    var signature = this.sign(jsapi_ticket, nonceStr, timestamp, url);
    then.config = {
      title: '中信银行-上海分行',
      desc: '全心全意为客户提供优质的金融产品和服务器，打造上海地区最佳综合融资服务银行。',
      link: window.location.href.split('?')[0],
      imgUrl: window.location.origin + '/static/img/logo.jpg',
    }
    wx.config({
      debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
      appId: appId, // 必填，公众号的唯一标识
      timestamp: timestamp, // 必填，生成签名的时间戳
      nonceStr: nonceStr, // 必填，生成签名的随机串
      signature: signature, // 必填，签名，见附录1
      jsApiList: ['onMenuShareTimeline', 'onMenuShareAppMessage']
      // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
    then.share({});
  },
  share(obj) {
    var then = this;
    // 分享朋友圈
    wx.ready(function() {
      wx.onMenuShareTimeline({
        title: obj.title || then.config.title, // 分享标题
        desc: obj.desc || then.config.desc, // 分享描述
        link: obj.link || then.config.link, // 分享链接
        imgUrl: obj.imgUrl || then.config.imgUrl, // 分享图标
        success: function() {
          // 用户确认分享后执行的回调函数
          // alert("分享朋友圈成功");
        },
        cancel: function() {
          // 用户取消分享后执行的回调函数
          // alert("分享朋友圈失败");
        }
      });
      // 朋友
      wx.onMenuShareAppMessage({
        title: obj.title || then.config.title, // 分享标题
        desc: obj.desc || then.config.desc, // 分享描述
        link: obj.link || then.config.link, // 分享链接
        imgUrl: obj.imgUrl || then.config.imgUrl, // 分享图标
        type: 'link', // 分享类型,music、video或link，不填默认为link
        dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
        success: function() {
          // 用户确认分享后执行的回调函数
          // alert("分享朋友成功");
        },
        cancel: function() {
          // 用户取消分享后执行的回调函数
          // alert("分享朋友失败");
        }
      });
    });
  },
  sign(jsapi_ticket, nonceStr, timestamp, url) {
    var ret = {
      jsapi_ticket: jsapi_ticket,
      nonceStr: nonceStr,
      timestamp: timestamp,
      url: url
    };
    var keys = Object.keys(ret);
    keys = keys.sort();
    var newArgs = {};
    keys.forEach(function(key) {
      newArgs[key.toLowerCase()] = ret[key];
    });
    var string = '';
    for (var k in newArgs) {
      string += '&' + k + '=' + newArgs[k];
    }
    var signStr = string.substr(1);
    return CryptoJS.SHA1(signStr).toString();
  }
};
