<!-- login -->
<template>
  <el-row class="login-wrapper" v-loading="loading">
    <el-row class="login-content">
      <h1>校友信息管理平台</h1>
      <el-row class="login">
        <el-col :span="24">
          <el-form :model="formData" status-icon ref="formData">
            <el-form-item prop="username" :rules="{ required: true, message: '请输入登录名', trigger: 'blur' }">
              <el-input class="login-input" type="text" placeholder="请输入用户名" v-model="formData.username" autocomplete="off">
                <template slot="prepend"><i class="el-icon-user"></i></template>
              </el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input class="login-input" type="password" placeholder="请输入密码" @keyup.enter.native="submitForm('formData')" v-model="formData.password" autocomplete="off">
                <template slot="prepend"><i class="el-icon-unlock"></i></template>
              </el-input>
            </el-form-item>
            <el-form-item class="login-btn">
              <el-row class="r_wrapper">
                没有账号？立即注册一个
                <el-button type="primary" @click.native="$router.push({name: 'register'})">注册</el-button>
              </el-row>
              <el-button type="primary" class="submitBtn" @click.native="submitForm('formData')">登录</el-button>
              <el-button class="resetBtn" @click.native="resetForm('formData')">重置</el-button>
            </el-form-item>
          </el-form>
        </el-col>
      </el-row>
    </el-row>
  </el-row>
</template>
<script>
export default {
  name: 'login',
  data() {
    return {
      loading: false,
      formData: {}
    };
  },
  methods: {
    submitForm(formName) {
      let vm = this;
      vm.$refs[formName].validate((valid) => {
        if (valid) {
          vm.loading = true;
          vm.post(vm.$var.port + '/login.php', vm.formData).then(function (res) {
            vm.loading = false;
            if (res.msg == '用户名或密码错误！') {
              vm.$message({
                message: '用户名或密码错误！',
                type: 'error'
              });
              return false;
            }
            vm.$store.commit('setUserInfo', res.data);
            vm.$message({
              message: '登录成功',
              type: 'success'
            });
            // let redirect = decodeURIComponent(vm.$route.query.redirect || '/');
            // vm.$router.push({ path: redirect });
            vm.$router.push({ name: 'home' });
          }, function (res) {
            vm.loading = false;
          });
        } else {
          vm.errorValidate();
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  }
};

</script>
<style lang="less">
.login-input .el-input__inner {
  height: 50px;
  width: 400px;
}

.login .el-input-group__prepend {
  font-size: 25px;
}
</style>
<style lang='less' scoped>
.el-input {
  font-size: 15px;
}

.login-btn {
  text-align: center;
}

.resetBtn,
.submitBtn {
  width: 217px;
}

.resetBtn {
  margin-left: 15px;
}
.r_wrapper{
  padding-bottom:20px;
}
.login-wrapper {
  width: 100%;
  height: 100%;
  background-image: url(../../assets/login-bg.jpg);
  background-size: 100% 100%;
  background-repeat: no-repeat;
  background-attachment: fixed;
  position: relative;

  .login-content {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-left: -317px;
    margin-top: -242px;
  }

  h1 {
    font-size: 38px;
    color: #1aabed;
    font-weight: 500;
    text-align: center;
    // margin-left:-100px;
    margin-bottom: 20px;
  }

  .login {
    padding: 90px;
    width: 635px;
    height: 414px;
    background: rgba(255, 255, 255, 0.5);
    border-radius: 10px;
    box-shadow: rgb(51, 51, 51) 0px 0px 10px;
  }
}
</style>
