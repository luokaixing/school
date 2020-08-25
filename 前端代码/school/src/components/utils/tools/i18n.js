import Vue from 'vue';
import VueI18n from 'vue-i18n';
Vue.use(VueI18n);

// 以下为语言包单独设置的场景，单独设置时语言包需单独引入
const messages = {
  'zh_cn': require('../../../assets/i18n/zh.js'), // 中文语言包
  'zh_tw': require('../../../assets/i18n/tw.js'), // 繁体语言包
  'en_us': require('../../../assets/i18n/en.js') // 英文语言包
};

// 最后 export default，这一步肯定要写的。
export default new VueI18n({
  locale: 'zh_cn', // set locale 默认显示英文
  messages: messages // set locale messages
});
