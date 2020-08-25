import Vue from 'vue';
import Vuex from 'vuex';
import VuexPersistence from 'vuex-persist';
Vue.use(Vuex);
const state = {
  userInfo: {},
  treeState: '',
  tools: {
    tableHeight: 300
  }
};
const mutations = {
  setUserInfo(state, info) {
    state.userInfo = info;
  },
  setTreeState(state, info) {
    state.treeState = info;
  }
};
const actions = {
  setUserInfo({ commit }, info) {
    commit('setUserInfo', info);
  },
  setTreeState({ commit }, info) {
    commit('setTreeState', '');
    setTimeout(() => {
      commit('setTreeState', info);
    }, 600);
  }
};
const getters = {
  getUserInfo(state) {
    return state.userInfo;
  },
  getTreeState(state) {
    return state.treeState;
  }
};
const vuexLocal = new VuexPersistence({
  storage: window.localStorage,
  reducer: (state) => ({
    userInfo: state.userInfo
  }),
  filter: (mutation) => (
    mutation.type === 'setUserInfo'
  )
});
export default new Vuex.Store({
  state,
  mutations,
  actions,
  getters,
  plugins: [vuexLocal.plugin]
});
