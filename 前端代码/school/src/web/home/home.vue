<template>
  <div class="wrapper">
    <el-container>
      <el-header class="myHeader" height="134px">
        <page-header></page-header>
        <el-menu :default-active="activeIndex" background-color="#545c64" text-color="#fff" active-text-color="rgb(182,194,154)" class="el-menu-demo" style="padding-left:30px;" mode="horizontal" @select="handleSelect">
          <el-menu-item index="1">首页</el-menu-item>
          <el-menu-item index="2">留言中心</el-menu-item>
          <el-menu-item index="3">可能认识的人</el-menu-item>
          <el-submenu index="4">
            <template slot="title">校友信息查询管理</template>
            <el-menu-item index="4-1">校友信息查询</el-menu-item>
            <el-menu-item index="4-2">班级信息查询管理</el-menu-item>
          </el-submenu>
          <el-menu-item index="5" v-if="$store.state.userInfo.username == 'admin'">领导信息管理</el-menu-item>
          <el-menu-item index="6" v-if="$store.state.userInfo.username == 'admin'">优秀校友信息管理</el-menu-item>
          <el-menu-item index="7" v-if="$store.state.userInfo.username == 'admin'">新闻信息管理</el-menu-item>
          <el-menu-item index="8" v-if="$store.state.userInfo.username == 'admin'">留言信息管理</el-menu-item>
        </el-menu>
      </el-header>
      <router-view v-wechat-title="$route.meta.title"></router-view>
      <page-footer></page-footer>
    </el-container>
  </div>
</template>

<script>
import PageHeader from '../public/header';
import PageFooter from '../public/footer';

export default {
  name: 'home',
  components: {
    PageHeader,
    PageFooter
  },
  props: {},
  data() {
    return {
      activeIndex: ''
    };
  },
  watch: {},
  computed: {},
  methods: {
    handleSelect(key, keyPath) {
      if (key == 1) {
        this.$router.push({name: 'school'});
      }
      if (key == 2) {
        this.$router.push({name: 'newsCenter'});
      }
      if (key == 3) {
        this.$router.push({name: 'classmate'});
      }
      if (key == '4-1') {
        this.$router.push({name: 'peopleList'});
      }
      if (key == '4-2') {
        this.$router.push({name: 'classList'});
      }
      if (key == 5) {
        this.$router.push({name: 'leader'});
      }
      if (key == 6) {
        this.$router.push({name: 'mate'});
      }
      if (key == 7) {
        this.$router.push({name: 'news'});
      }
      if (key == 8) {
        this.$router.push({name: 'msg'});
      }
    }
  },
  created() {},
  mounted() {
    this.handleSelect();
    if (this.$route.path == '/home/school') {
      this.activeIndex = 1;
    }
    if (this.$route.path == '/home/newsCenter') {
      this.activeIndex = 2;
    }
    if (this.$route.path == '/home/classmate') {
      this.activeIndex = 3;
    }
    if (this.$route.path == '/home/peopleList') {
      this.activeIndex = '4-1';
    }
    if (this.$route.path == '/home/classList') {
      this.activeIndex = '4-2';
    }
    if (this.$route.path == '/home/leader') {
      this.activeIndex = 5;
    }
    if (this.$route.path == '/home/mate') {
      this.activeIndex = 6;
    }
    if (this.$route.path == '/home/news') {
      this.activeIndex = 7;
    }
    if (this.$route.path == '/home/msg') {
      this.activeIndex = 8;
    }
  }
};
</script>
<style lang="less" scoped>
.wrapper{
  width:100%;
  .myHeader{
    padding:0;
    background-image: url(../../assets/bg.jpg);
  }
}
</style>