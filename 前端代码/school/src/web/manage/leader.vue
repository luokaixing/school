<template>
  <div class="wrapper">
    <el-row class="top_btn">
      <el-form :model="formData" label-width="60px"  id="formData" label-position="right" ref="formData">
        <el-row class="con_data">
          <el-col :span="24" class="btn-right">
            <el-form-item>
              <el-button type="primary"  @click="dialogFormVisible = true" icon="el-icon-plus">新增学校领导</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-row>
    <el-col :span="24" class="table">
      <el-table  :data="tableData" border stripe v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)" empty-text="未查到相关领导信息" height="280">
        <el-table-column fixed type="index" label="行号" align="center" width="50"></el-table-column>
        <el-table-column prop="leader_name" fixed label="姓名" width="150" align="center"></el-table-column>
        <el-table-column prop="leader_pos" label="职位" width="250" align="center"></el-table-column>
        <el-table-column prop="leader_con" label="描述" width="250" align="center"></el-table-column>
        <el-table-column prop="leader_time" label="时间" width="250" align="center"></el-table-column>
        <el-table-column fixed="right" label="操作" width="200" align="center">
          <template slot-scope="scope">
            <el-button @click="handleDelete(scope.row.leader_id)" type="danger" size="mini">删除</el-button>
            <el-button type="primary" size="mini" @click="update(scope.row)">修改领导信息</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-col>
    <el-col :span="24" class="myPage">
      <el-pagination @current-change="handleCurrentChange" :page-size="limit" background layout="total, prev, pager, next,jumper" :current-page="pager.current" :total="pager.total"></el-pagination>
    </el-col>
    <el-dialog :title="titleText" :visible.sync="dialogFormVisible">
      <el-form :model="formData1">
        <el-form-item label="领导名字" label-width="80px">
          <el-input v-model="formData1.leader_name" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="领导职位" label-width="80px">
          <el-input v-model="formData1.leader_pos" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="领导描述" label-width="80px">
          <el-input v-model="formData1.leader_con" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false;formData1 = {};">取 消</el-button>
        <el-button type="primary" @click="add()">确 定</el-button>
      </div>
    </el-dialog>
    <el-dialog title="修改领导信息" :visible.sync="dialogFormVisible1">
      <el-form :model="formData2">
        <el-form-item label="领导名字" label-width="80px">
          <el-input v-model="formData2.leader_name" disabled="true" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="领导职位" label-width="80px">
          <el-input v-model="formData2.leader_pos" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="领导描述" label-width="80px">
          <el-input v-model="formData2.leader_con" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false;formData2 = {};">取 消</el-button>
        <el-button type="primary" @click="save()">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: 'leader',
  components: {},
  props: {},
  data() {
    return {
      formData: {},
      formData1: {},
      formData2: {},
      titleText: '新增学校领导信息',
      dialogFormVisible: false,
      dialogFormVisible1: false,
      loading: false,
      myData: [],
      limit: 10,
      pager: {
        total: 100,
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
      vm.formData2 = row;
      vm.dialogFormVisible1 = true;
    },
    save() {
      let vm = this;
      let params = vm.extend({
        size: 10
      }, vm.formData2);
      vm.post(vm.$var.port + '/upLeader.php', params).then(function (res) {
        vm.dialogFormVisible1 = false;
        vm.$message({
          message: '修改成功',
          type: 'success'
        });
        vm.initData();
        vm.formData2 = {};
      }, function () {
        vm.dialogFormVisible1 = false;
      });
    },
    add() {
      let vm = this;
      let params = vm.extend({
        size: 10
      }, vm.formData1);
      vm.post(vm.$var.port + '/leader.php', params).then(function (res) {
        vm.dialogFormVisible = false;
        vm.$message({
          message: '新增成功',
          type: 'success'
        });
        vm.initData();
        vm.formData1 = {};
      }, function () {
        vm.dialogFormVisible = false;
      });
    },
    handleDelete(id) {
      let vm = this;
      let params = vm.extend({
        id: id,
        size: 10
      }, vm.formData);
      vm.post(vm.$var.port + '/delLeader.php', params).then(function (res) {
        vm.$message({
          message: '删除成功',
          type: 'success'
        });
        vm.initData();
      }, function () {
      });
    },
    handleCurrentChange(val) {
      this.pager.current = val;
      this.tableData = this.myData.filter((item, index) =>
        index < this.pager.current * 10 && index >= 10 * (this.pager.current - 1)
      );
    },
    initData(page) {
      let vm = this;
      let params = vm.extend({
        current: page || 1,
        size: 10
      }, vm.formData);
      vm.loading = true;
      vm.post(vm.$var.port + '/findAllL.php', params).then(function (res) {
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