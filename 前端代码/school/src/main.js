// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import App from './App';
import router from './router';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import store from './store';
import './less/public.less';
import 'babel-polyfill';
import VueWechatTitle from 'vue-wechat-title';
import './http';
import index from './index';
import utils from './components/index';
import i18n from './components/utils/tools/i18n';

Vue.config.productionTip = false;
Vue.use(ElementUI);
Vue.use(VueWechatTitle);
Vue.use(index);
Vue.use(utils);
const bus = new Vue();

/* eslint-disable no-new */
new Vue({
  el: '#app',
  data: {
    bus
  },
  i18n,
  router,
  store,
  components: { App },
  template: '<App/>'
});
