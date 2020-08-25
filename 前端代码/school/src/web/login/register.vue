<!-- register -->
<template>
  <el-row class="detail">
    <el-col :span="24">
      <h1 class="title"><span>{{($route.params.userInfo)?'用户信息修改':'用户注册'}}</span></h1>
      <el-form :model="formData" ref="formData"  label-width="150px" class="formData">
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="用户名" prop="username" :rules="{ required: true, message: '请输入用户名', trigger: 'blur' }">
              <el-input type="text" v-model="formData.username" placeholder="请输入用户名" autocomplete="off">
                <template slot="prepend"><i class="el-icon-user"></i></template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="密码" prop="password" :rules="{ required: true, validator: this.checkPassword, trigger: 'blur' }">
              <el-input type="password" v-model="formData.password" placeholder="请输入密码" autocomplete="off">
                <template slot="prepend"><i class="el-icon-unlock"></i></template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="学号" prop="stuno" :rules="{ required: true, message: '请输入学号', trigger: 'blur' }">
              <el-input type="text" v-model="formData.stuno" placeholder="请输入学号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="班级编号" prop="class" :rules="{ required: true, message: '请输入班级编号', trigger: 'blur' }">
              <el-input type="text" v-model="formData.class" placeholder="请输入班级编号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="专业" prop="major" :rules="{ required: true, message: '请输入您的专业', trigger: 'blur' }">
              <el-input type="text" v-model="formData.major" placeholder="请输入您的专业" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="性别" prop="gender" :rules="{ required: true, message: '请选择性别', trigger: 'blur' }">
              <el-radio-group v-model="formData.gender">
                <el-radio label="男" value="男"></el-radio>
                <el-radio label="女" value="女"></el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="入学年份" prop="grade" :rules="{ required: true, message: '请选择入学年份', trigger: 'blur' }">
              <el-select v-model="formData.grade" placeholder="请选择入学年份">
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="key">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="手机号" prop="phone" :rules="{ required: true,validator: this.checkMyPhone, trigger: 'blur' }">
              <el-input type="text" v-model="formData.phone" placeholder="请输入手机号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="出生日期" prop="birthday" :rules="{ required: true, message: '请选择您的生日', trigger: 'blur' }">
              <el-date-picker v-model="formData.birthday" :editable="false" type="date" value-format="yyyy-MM-dd" placeholder="请选择您的生日">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="家庭地址" prop="address" :rules="{ required: true, message: '请输入家庭住址', trigger: 'blur' }">
              <el-input type="text" v-model="formData.address" placeholder="请输入家庭地址" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12" :offset="5">
            <el-form-item label="公司" prop="company" :rules="{ required: true, message: '请输入公司名', trigger: 'blur' }">
              <el-input type="text" v-model="formData.company" placeholder="请输入公司名" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row class="submit-box">
          <el-col :span="24" style="text-align:center;">
            <el-form-item label-width="0" style="margin-top:17px;">
              <el-button type="primary" class="myBtn" @click="submitForm('formData')">提交</el-button>
              <el-button class="myBtn" @click="$router.go(-1)">返回</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-col>
  </el-row>
</template>

<script>
export default {
  name: 'register',
  data () {
    return {
      loading: false,
      formData: {}
    };
  },
  mounted() {
    let vm = this;
    if (vm.$route.params.userInfo) {
      vm.formData = vm.$route.params.userInfo;
    }
  },
  methods: {
    checkPassword(rule, value, callback) {
      if (!value) {
        return callback(new Error('密码不能为空'));
      } else {
        var zz = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,}$/;
        if (!zz.test(value)) {
          return callback(new Error('密码必须为数字加字母，且不低于8位'));
        } else {
          callback();
        }
      }
    },
    checkMyPhone(rule, value, callback) {
      if (!value) {
        return callback(new Error('手机号不能为空'));
      } else {
        var zz = /^1(3|4|5|6|7|8|9)\d{9}$/;
        if (!zz.test(value)) {
          return callback(new Error('输入的手机号格式错误！'));
        } else {
          callback();
        }
      }
    },
    submitForm(formName) {
      let vm = this;
      // this.$message({
      //   message: '恭喜你，注册成功！',
      //   type: 'success'
      // });
      // vm.$router.push({ name: 'home' });
      vm.$refs[formName].validate((valid) => {
        if (valid) {
          vm.loading = true;
          // console.log(vm.formData);
          if (vm.$route.params.userInfo) {
            vm.post(vm.$var.port + '/update.php', vm.formData).then(function(res) {
              vm.$message({
                type: 'success',
                message: '用户信息修改成功！'
              });
              vm.$router.push({ name: 'home' });
            }, function(res) {
              vm.loading = false;
            });
          } else {
            vm.post(vm.$var.port + '/reg.php', vm.formData).then(function(res) {
              vm.loading = false;
              if (res.data == '用户名已存在,注册失败') {
                vm.$message({
                  type: 'error',
                  message: '用户名已存在,注册失败!'
                });
                return false;
              }
              vm.$message({
                type: 'success',
                message: '注册成功！'
              });
              vm.$router.push({ name: 'login' });
            }, function(res) {
              vm.loading = false;
            });
          }
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

</style>
<style lang='less' scoped>
.title{
  padding:20px;
  text-align:center;
}
.submit-box{
  position:fixed;
  left:0;
  bottom:0;
  height:72px;
  background: #cdcdcd;
  width:100%;
}
.myBtn{
  width:225px;
}
.detail{
  padding-bottom:92px;
}
</style>
