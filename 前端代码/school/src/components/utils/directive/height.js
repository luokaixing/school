import Vue from 'vue';
Vue.directive('height', {
  inserted: function (el) {
    $(window).resize(function (event) {
      scroll();
    });
    scroll();
    function scroll() {
      var height = $(window).height() - $('.ivu-layout-header').height();
      $(el).height(height);
    }
  }
});