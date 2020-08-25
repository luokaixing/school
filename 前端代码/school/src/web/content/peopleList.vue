<template>
  <div class="wrapper">
    <el-row class="top_btn">
      <el-form :model="formData" label-width="60px"  id="formData" label-position="right" ref="formData">
        <el-row class="con_data">
          <el-col :span="6">
            <el-form-item label="姓名" prop="username">
              <el-input v-model="formData.username" placeholder="请输入姓名" clearable></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="年级" prop="grade" >
              <el-select v-model="formData.grade" placeholder="请选择年级" clearable>
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="Number(key)">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="班级" prop="class">
              <el-input v-model="formData.class" placeholder="请输入班级" clearable></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="手机" prop="phone">
              <el-input v-model="formData.phone" placeholder="请输入手机号" clearable></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row class="con_data">
          <el-col :span="6">
            <el-form-item label="学号" prop="stuno">
              <el-input v-model="formData.stuno" placeholder="请输入学号" clearable></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" class="btn-right">
            <el-form-item>
              <el-button type="primary" @click="initData()" icon="el-icon-search">查询</el-button>
              <el-button type="primary" @click="dialogFormVisible1 = true" :disabled="!($store.state.userInfo.username == 'admin')" icon="el-icon-plus">新增校友</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-row>
    <el-col :span="24" class="table">
      <el-table  :data="tableData" border stripe v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)" empty-text="未查到相关校友信息" height="280">
        <el-table-column fixed type="index" label="行号" align="center" width="50"></el-table-column>
        <el-table-column prop="username" fixed label="姓名" width="150" align="center"></el-table-column>
        <el-table-column prop="stuno" label="学号" width="250" align="center"></el-table-column>
        <el-table-column prop="grade" label="年级" width="100" align="center"></el-table-column>
        <el-table-column prop="class" label="班级" width="100" align="center"></el-table-column>
        <el-table-column prop="class_no" label="管理的班级" width="100" align="center"></el-table-column>
        <el-table-column prop="phone" label="手机号码" width="150" align="center"></el-table-column>
        <el-table-column prop="gender" label="性别" width="100" align="center"></el-table-column>
        <el-table-column prop="major" show-overflow-tooltip label="专业" width="100" align="center"></el-table-column>
        <el-table-column prop="address" show-overflow-tooltip label="家庭住址" width="250" align="center"></el-table-column>
        <el-table-column prop="company" label="目前所在公司" width="150" align="center"></el-table-column>
        <el-table-column prop="birthday" label="出生日期" width="250" align="center"></el-table-column>
        <el-table-column fixed="right" label="操作" width="400" align="center">
          <template slot-scope="scope">
            <el-button @click="handleDelete(scope.row.id)" type="danger" :disabled="!($store.state.userInfo.username == 'admin')" size="mini">删除</el-button>
            <el-button type="primary" size="mini" :disabled="!($store.state.userInfo.username == 'admin') && !(scope.row.username == $store.state.userInfo.username)" @click="update(scope.row)">修改用户信息</el-button>
            <el-button type="primary" size="mini" :disabled="!($store.state.userInfo.username == 'admin')" @click="bindClass(scope.row)">绑定班级管理员</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-col>
    <el-col :span="24" class="myPage">
      <el-pagination @current-change="handleCurrentChange" :page-size="limit" background layout="total, prev, pager, next,jumper" :current-page="pager.current" :total="pager.total"></el-pagination>
    </el-col>
    <el-dialog :title="digText" :visible.sync="dialogFormVisible1">
      <el-form :model="formData2" ref="formData2"  label-width="150px" class="formData">
        <el-row>
          <el-col>
            <el-form-item label="用户名" prop="username" :rules="{ required: true, message: '请输入用户名', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.username" placeholder="请输入用户名" autocomplete="off">
                <template slot="prepend"><i class="el-icon-user"></i></template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="密码" prop="password" :rules="{ required: true, validator: this.checkPassword, trigger: 'blur' }">
              <el-input type="password" v-model="formData2.password" placeholder="请输入密码" autocomplete="off">
                <template slot="prepend"><i class="el-icon-unlock"></i></template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="学号" prop="stuno" :rules="{ required: true, message: '请输入学号', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.stuno" placeholder="请输入学号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="班级编号" prop="class" :rules="{ required: true, message: '请输入班级编号', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.class" placeholder="请输入班级编号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="专业" prop="major" :rules="{ required: true, message: '请输入您的专业', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.major" placeholder="请输入您的专业" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="性别" prop="gender" :rules="{ required: true, message: '请选择性别', trigger: 'blur' }">
              <el-radio-group v-model="formData2.gender">
                <el-radio label="男" value="男"></el-radio>
                <el-radio label="女" value="女"></el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="入学年份" prop="grade" :rules="{ required: true, message: '请选择入学年份', trigger: 'blur' }">
              <el-select v-model="formData2.grade" placeholder="请选择入学年份">
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="key">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="手机号" prop="phone" :rules="{ required: true,validator: this.checkMyPhone, trigger: 'blur' }">
              <el-input type="text" v-model="formData2.phone" placeholder="请输入手机号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="出生日期" prop="birthday" :rules="{ required: true, message: '请选择您的生日', trigger: 'blur' }">
              <el-date-picker v-model="formData2.birthday" :editable="false" type="date" value-format="yyyy-MM-dd" placeholder="请选择您的生日">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="家庭地址" prop="address" :rules="{ required: true, message: '请输入家庭住址', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.address" placeholder="请输入家庭地址" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="公司" prop="company" :rules="{ required: true, message: '请输入公司名', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.company" placeholder="请输入公司名" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false;formData2 = {};">取 消</el-button>
        <el-button type="primary" @click="save('formData2')">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog :title="digText" :visible.sync="dialogFormVisible2">
      <el-form :model="formData3" ref="formData3"  label-width="150px" class="formData">
        <el-row>
          <el-col>
            <el-form-item label="用户名" prop="username" :rules="{ required: true, message: '请输入用户名', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.username" :disabled="nameFlag" placeholder="请输入用户名" autocomplete="off">
                <template slot="prepend"><i class="el-icon-user"></i></template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="密码" prop="password" :rules="{ required: true, validator: this.checkPassword, trigger: 'blur' }">
              <el-input type="password" v-model="formData3.password" placeholder="请输入密码" autocomplete="off">
                <template slot="prepend"><i class="el-icon-unlock"></i></template>
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="学号" prop="stuno" :rules="{ required: true, message: '请输入学号', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.stuno" placeholder="请输入学号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="班级编号" prop="class" :rules="{ required: true, message: '请输入班级编号', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.class" placeholder="请输入班级编号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="专业" prop="major" :rules="{ required: true, message: '请输入您的专业', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.major" placeholder="请输入您的专业" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="性别" prop="gender" :rules="{ required: true, message: '请选择性别', trigger: 'blur' }">
              <el-radio-group v-model="formData3.gender">
                <el-radio label="男" value="男"></el-radio>
                <el-radio label="女" value="女"></el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="入学年份" prop="grade" :rules="{ required: true, message: '请选择入学年份', trigger: 'blur' }">
              <el-select v-model="formData3.grade" placeholder="请选择入学年份">
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="key">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="手机号" prop="phone" :rules="{ required: true,validator: this.checkMyPhone, trigger: 'blur' }">
              <el-input type="text" v-model="formData3.phone" placeholder="请输入手机号" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="出生日期" prop="birthday" :rules="{ required: true, message: '请选择您的生日', trigger: 'blur' }">
              <el-date-picker v-model="formData3.birthday" :editable="false" type="date" value-format="yyyy-MM-dd" placeholder="请选择您的生日">
              </el-date-picker>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="家庭地址" prop="address" :rules="{ required: true, message: '请输入家庭住址', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.address" placeholder="请输入家庭地址" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="公司" prop="company" :rules="{ required: true, message: '请输入公司名', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.company" placeholder="请输入公司名" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible2 = false;formData3 = {};">取 消</el-button>
        <el-button type="primary" @click="saveAdd()">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="绑定为班级管理员" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="班级" prop="class_no" >
          <el-select v-model="form.class_no" :popper-append-to-body="false" placeholder="请选择班级" clearable>
            <el-option v-for="item in classOption" :key="item.value" :label="item.label" :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click.native="dialogFormVisible = false;vm.form={}">取 消</el-button>
        <el-button type="primary" @click.native="bindAdmin()">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'peopleList',
  components: {},
  props: {},
  data() {
    return {
      formData: {},
      formData2: {},
      formData3: {},
      form: {},
      classOption: [],
      myData: [],
      limit: 10,
      loading: false,
      digText: '新增用户',
      nameFlag: false,
      dialogFormVisible: false,
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      pager: {
        total: 0,
        current: 1
      },
      admin: 0,
      tableData: []
    };
  },
  watch: {},
  computed: {},
  methods: {
    init() {
      let vm = this;
      vm.initData();
    },
    bindClass(row) {
      let vm = this;
      vm.dialogFormVisible = true;
      vm.admin = row.id;
    },
    bindAdmin() {
      let vm = this;
      let params = vm.extend({
        id: vm.admin,
        size: 10
      }, vm.form);
      // vm.initData(1);
      vm.loading = true;
      vm.post(vm.$var.port + '/setAdmin.php', params).then(function(res) {
        vm.loading = false;
        vm.dialogFormVisible = false;
        vm.$message({
          type: 'success',
          message: '绑定成功！'
        });
        vm.initData(1);
      }, function(res) {
        vm.dialogFormVisible = false;
        vm.loading = false;
      });
    },
    saveAdd() {
      let vm = this;
      vm.loading = true;
      vm.post(vm.$var.port + '/update.php', vm.formData3).then(function(res) {
        vm.loading = false;
        vm.dialogFormVisible2 = false;
        vm.$message({
          type: 'success',
          message: '修改成功！'
        });
        vm.initData();
      }, function(res) {
        vm.dialogFormVisible2 = false;
        vm.loading = false;
      });
    },
    update(row) {
      let vm = this;
      vm.nameFlag = true;
      vm.dialogFormVisible2 = true;
      vm.formData3 = row;
    },
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
    handleCurrentChange(val) {
      this.pager.current = val;
      this.tableData = this.myData.filter((item, index) =>
        index < this.pager.current * 10 && index >= 10 * (this.pager.current - 1)
      );
    },
    handleDelete(id) {
      let vm = this;
      let params = vm.extend({
        id: id,
        size: 10
      }, vm.formData);
      vm.post(vm.$var.port + '/delUser.php', params).then(function (res) {
        vm.$message({
          message: '删除成功',
          type: 'success'
        });
        vm.initData();
      }, function () {
      });
    },
    save(formName, type) {
      let vm = this;
      vm.$refs[formName].validate((valid) => {
        if (valid) {
          vm.loading = true;
          vm.post(vm.$var.port + '/reg.php', vm.formData2).then(function(res) {
            vm.loading = false;
            if (res.data == '用户名已存在,新增失败') {
              vm.$message({
                type: 'error',
                message: '用户名已存在,新增失败!'
              });
              return false;
            }
            vm.dialogFormVisible1 = false;
            vm.$message({
              type: 'success',
              message: '新增成功！'
            });
            vm.initData();
          }, function(res) {
            vm.dialogFormVisible1 = false;
            vm.loading = false;
          });
        } else {
          vm.errorValidate();
          return false;
        }
      });
    },
    initData(page) {
      let vm = this;
      let params = vm.extend({
        current: page || 1,
        size: 10
      }, vm.formData);
      vm.loading = true;
      vm.post(vm.$var.port + '/test1.php', params).then(function (res) {
        vm.loading = false;
        vm.pager.total = res.length;
        vm.pager.current = 1;
        vm.myData = res;
        vm.handleCurrentChange(1);
      }, function () {
        vm.loading = false;
      });
      vm.post(vm.$var.port + '/findClass.php', vm.formData3).then(function(res) {
        let tempData = res;
        for (let i = 0; i < tempData.length; i++) {
          tempData[i].value = tempData[i].class_no;
          tempData[i].label = tempData[i].class_no;
        }
        vm.classOption = tempData;
      }, function(res) {
      });
    }
  },
  created() {},
  mounted() {
    let vm = this;
    vm.init();
  }
};
</script>
<style lang="less" scoped>
.wrapper{
  .con_data{
    padding-top:10px;
  }
  .con_center{
    text-align:center;
  }
}
.table{
  padding:30px;
}
.top_btn{
  border-bottom:1px solid #cdcdcd;
}
.myPage{
  text-align: center;
  padding-bottom:30px;
}
</style>