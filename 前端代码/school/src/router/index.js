import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);
const routes = [{
  path: '/',
  name: 'login',
  redirect: 'login',
  component: resolve => require(['../web/login/login'], resolve)
}, {
  path: '/login',
  name: 'login',
  meta: {
    title: '登录页面',
    isLogin: false
  },
  component: resolve => require(['../web/login/login'], resolve)
}, {
  path: '/register',
  name: 'register',
  meta: {
    title: '注册页面',
    isLogin: false
  },
  component: resolve => require(['../web/login/register'], resolve)
}, {
  path: '/home',
  name: 'home',
  meta: {
    title: '校友信息主页页面',
    isLogin: true
  },
  redirect: '/home/school',
  children: [
    {
      path: 'school',
      name: 'school',
      meta: {
        title: '校友信息主页页面',
        isLogin: true
      },
      component: resolve => require(['../web/content/school'], resolve)
    }, {
      path: 'newsCenter',
      name: 'newsCenter',
      meta: {
        title: '校友留言/新闻中心',
        isLogin: true
      },
      component: resolve => require(['../web/content/newsCenter'], resolve)
    }, {
      path: 'classmate',
      name: 'classmate',
      meta: {
        title: '可能认识的人',
        isLogin: true
      },
      component: resolve => require(['../web/content/classmate'], resolve)
    }, {
      path: 'peopleList',
      name: 'peopleList',
      meta: {
        title: '校友信息管理',
        isLogin: true
      },
      component: resolve => require(['../web/content/peopleList'], resolve)
    }, {
      path: 'classList',
      name: 'classList',
      meta: {
        title: '班级信息管理',
        isLogin: true
      },
      component: resolve => require(['../web/content/classList'], resolve)
    }, {
      path: 'leader',
      name: 'leader',
      meta: {
        title: '领导信息管理',
        isLogin: true
      },
      component: resolve => require(['../web/manage/leader'], resolve)
    }, {
      path: 'mate',
      name: 'mate',
      meta: {
        title: '校友信息管理',
        isLogin: true
      },
      component: resolve => require(['../web/manage/mate'], resolve)
    }, {
      path: 'news',
      name: 'news',
      meta: {
        title: '新闻信息管理',
        isLogin: true
      },
      component: resolve => require(['../web/manage/news'], resolve)
    }, {
      path: 'msg',
      name: 'msg',
      meta: {
        title: '班级信息管理',
        isLogin: true
      },
      component: resolve => require(['../web/manage/msg'], resolve)
    }, {
      path: 'detail',
      name: 'detail',
      meta: {
        title: '新闻详情页面',
        isLogin: true
      },
      component: resolve => require(['../web/content/detail'], resolve)
    }, {
      path: 'msgDetail',
      name: 'msgDetail',
      meta: {
        title: '留言详情页面',
        isLogin: true
      },
      component: resolve => require(['../web/content/msgDetail'], resolve)
    }, {
      path: 'leaderDetail',
      name: 'leaderDetail',
      meta: {
        title: '领导信息详情页面',
        isLogin: true
      },
      component: resolve => require(['../web/content/leaderDetail'], resolve)
    }, {
      path: 'mateDetail',
      name: 'mateDetail',
      meta: {
        title: '校友信息详情页面',
        isLogin: true
      },
      component: resolve => require(['../web/content/mateDetail'], resolve)
    }
  ],
  component: resolve => require(['../web/home/home'], resolve)
}, {
  path: '/404',
  name: '404',
  meta: {
    title: '404页面不存在',
    isLogin: false
  },
  component: resolve => require(['../web/404'], resolve)
}];
const router = new Router({
  // mode: 'history',
  routes
});
router.beforeEach((to, from, next) => {
  if (to.matched.some(r => r.meta.isLogin)) {
    if (window.localStorage.getItem('vuex') != null) {
      setTimeout(function() {
        next();
      }, 100);
    } else {
      next({
        path: '/',
        query: {
          redirect: to.fullPath
        }
      });
    }
  } else {
    next();
  }
});
export default router;
