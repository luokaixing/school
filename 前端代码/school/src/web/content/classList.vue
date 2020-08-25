<template>
  <div class="wrapper">
    <el-row class="top_btn">
      <el-form :model="formData" label-width="60px"  id="formData" label-position="right" ref="formData">
        <el-row class="con_data">
          <el-col :span="6">
            <el-form-item label="年级" prop="grade" >
              <el-select v-model="formData.class_grade" placeholder="请选择年级" clearable>
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="Number(key)">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="班级" prop="class_no">
              <el-input v-model="formData.class_no" placeholder="请输入班级" clearable></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12" class="btn-right">
            <el-form-item>
              <el-button type="primary" @click="initData()" icon="el-icon-search">查询</el-button>
              <el-button type="primary" @click="dialogFormVisible1 = true" :disabled="!($store.state.userInfo.username == 'admin')" icon="el-icon-plus">创建班级</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-row>
    <el-col :span="24" class="table">
      <el-table  :data="tableData" border stripe v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)" empty-text="未查到相关校友信息" height="280">
        <el-table-column fixed type="index" label="行号" align="center" width="50"></el-table-column>
        <el-table-column prop="class_teacher" label="班主任" align="center"></el-table-column>
        <el-table-column prop="class_admin" label="班级管理员" align="center"></el-table-column>
        <el-table-column prop="class_grade" label="年级" align="center"></el-table-column>
        <el-table-column prop="class_no" label="班级" align="center"></el-table-column>
        <el-table-column prop="class_time" label="时间日期" align="center"></el-table-column>
        <el-table-column fixed="right" label="操作" align="center">
          <template slot-scope="scope">
            <el-button @click="handleDelete(scope.row.class_id)" type="danger" :disabled="!($store.state.userInfo.username == 'admin')" size="mini">删除</el-button>
            <el-button type="primary" size="mini" :disabled="!($store.state.userInfo.username == 'admin') && !(scope.row.class_no == $store.state.userInfo.class_no)" @click="update(scope.row)">修改班级信息</el-button>
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
            <el-form-item label="班级名称" prop="class_no" :rules="{ required: true, message: '请输入班级名称', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.class_no" placeholder="请输入班级名称" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="班主任" prop="class_teacher" :rules="{ required: true, message: '请输入班主任', trigger: 'blur' }">
              <el-input type="text" v-model="formData2.class_teacher" placeholder="请输入班主任" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="年级" prop="class_grade" :rules="{ required: true, message: '请选择年级', trigger: 'blur' }">
              <el-select v-model="formData2.class_grade" placeholder="请选择年级">
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="key">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false;formData2 = {};">取 消</el-button>
        <el-button type="primary" @click="save('formData2')">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="修改班级信息" :visible.sync="dialogFormVisible2">
      <el-form :model="formData3" ref="formData3"  label-width="150px" class="formData">
        <el-row>
          <el-col>
            <el-form-item label="班级名称" prop="class_no" :rules="{ required: true, message: '请输入班级名称', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.class_no" :disabled=nameFlag placeholder="请输入班级名称" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="班主任" prop="class_teacher" :rules="{ required: true, message: '请输入班主任', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.class_teacher" placeholder="请输入班主任" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="年级" prop="class_grade" :rules="{ required: true, message: '请选择年级', trigger: 'blur' }">
              <el-select v-model="formData3.class_grade" placeholder="请选择年级">
                <el-option v-for="(val,key) in $var.gradeOption" :key="key" :label="val" :value="key">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="创建时间" prop="class_no" :rules="{ required: true, message: '请输入创建时间', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.class_time" :disabled=nameFlag placeholder="请输入创建时间" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col>
            <el-form-item label="班级管理员" prop="class_no" :rules="{ required: true, message: '请输入班级管理员', trigger: 'blur' }">
              <el-input type="text" v-model="formData3.class_admin" :disabled=nameFlag placeholder="请输入班级管理员" autocomplete="off">
              </el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible2 = false;formData3 = {};">取 消</el-button>
        <el-button type="primary" @click="upClass()">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'classList',
  components: {},
  props: {},
  data() {
    return {
      formData: {},
      formData2: {},
      formData3: {},
      myData: [],
      limit: 10,
      loading: false,
      digText: '新增班级',
      nameFlag: false,
      dialogFormVisible1: false,
      dialogFormVisible2: false,
      pager: {
        total: 0,
        current: 1
      },
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
    update(row) {
      let vm = this;
      vm.nameFlag = true;
      vm.dialogFormVisible2 = true;
      vm.formData3 = row;
    },
    upClass() {
      let vm = this;
      vm.loading = true;
      vm.post(vm.$var.port + '/upClass.php', vm.formData3).then(function(res) {
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
      vm.post(vm.$var.port + '/delClass.php', params).then(function (res) {
        vm.$message({
          message: '删除成功',
          type: 'success'
        });
        vm.initData();
      }, function () {
      });
    },
    save(formName) {
      let vm = this;
      vm.$refs[formName].validate((valid) => {
        if (valid) {
          vm.loading = true;
          vm.post(vm.$var.port + '/addClass.php', vm.formData2).then(function(res) {
            vm.loading = false;
            if (res.data == '班级已存在,新增失败') {
              vm.$message({
                type: 'error',
                message: '班级已存在,新增失败!'
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
      vm.post(vm.$var.port + '/findClass.php', params).then(function (res) {
        vm.loading = false;
        vm.pager.total = res.length;
        vm.pager.current = 1;
        vm.myData = res;
        vm.handleCurrentChange(1);
      }, function () {
        vm.loading = false;
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