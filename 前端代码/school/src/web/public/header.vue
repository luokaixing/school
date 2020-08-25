<template>
  <el-row>
    <el-row class="nav">
      <el-col :span="16">
        <h1>校友信息管理平台</h1>
      </el-col>
      <el-col :span="8" class="right">
        <el-link icon="el-icon-setting" @click="$router.push({name:'register', params: {userInfo: $store.state.userInfo}})" :underline="false">修改个人信息</el-link>
        <el-link icon="el-icon-switch-button" @click="loginOut" :underline="false">注销</el-link>
        <el-link icon="el-icon-user-solid" :underline="false">{{$store.state.userInfo.username}},你好!</el-link>
      </el-col>
    </el-row>
  </el-row>
</template>
<script>
export default {
  name: 'pageHeader',
  data() {
    return {};
  },
  mounted() {},
  methods: {
    loginOut() {
      let vm = this;
      localStorage.removeItem('vuex');
      vm.$message({
        showClose: true,
        message: '退出系统成功!',
        type: 'success'
      });
      vm.$router.push({ name: 'login' });
    }
  }
};

</script>
<style lang="less" scoped>
.nav {
  padding: 0 30px;
  background: rgba(0,0,0,0.5);
}

.nav-header {
  padding: 0 30px 0 265px;

  .el-menu--horizontal {
    border: 0;
  }

  .el-menu-item {
    color: #303133;
    font-size: 20px;

    &.is-active {
      border-bottom: 2px solid #fc3239;
    }
  }
}

h1 {
  text-align: left;
  font-size: 28px;
  color: #fff;
  line-height: 72px;
  cursor: pointer;
}

.right {
  a {
    color: #fff;
    font-size: 14px;
    float: right;
    display: inline-block;
    line-height: 72px;
    margin-left: 10px;

    &:hover {
      color: #fff;
    }
  }
}

</style>
