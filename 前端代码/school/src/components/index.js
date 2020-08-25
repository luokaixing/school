import './utils/directive/index';
import './utils/tools/tools';
import './utils/filter/index';
import './utils/variable/variable';
import './utils/service/index';
import './utils/validator/validator';
import LoadingComponent from './utils/loading/loading.vue';
const util = {
  install: function(Vue) {
    Vue.component('Loading', LoadingComponent);
  }
};

export default util;
