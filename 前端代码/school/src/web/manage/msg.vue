<template>
  <div class="wrapper">
    <el-col :span="24" class="table">
      <el-table  :data="tableData" border stripe v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)" empty-text="未查到相关留言信息" height="280">
        <el-table-column fixed type="index" label="行号" width="50" align="center"></el-table-column>
        <el-table-column prop="msg_name" fixed label="留言人姓名" align="center"></el-table-column>
        <el-table-column prop="msg_con" show-overflow-tooltip label="留言内容" align="center"></el-table-column>
        <el-table-column prop="msg_time" fixed label="留言时间" align="center"></el-table-column>
        <el-table-column fixed="right" label="操作" align="center">
          <template slot-scope="scope">
            <el-button @click="handleDelete(scope.row.msg_id)" type="danger" size="mini">删除</el-button>
            <el-button type="primary" size="mini" @click="update(scope.row)">修改留言信息</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-col>
    <el-col :span="24" class="myPage">
      <el-pagination @current-change="handleCurrentChange" :page-size="limit" background layout="total, prev, pager, next,jumper" :current-page="pager.current" :total="pager.total"></el-pagination>
    </el-col>
    <el-dialog title="修改留言信息" :visible.sync="dialogFormVisible1">
      <el-form :model="formData2">
        <el-form-item label="留言人姓名" label-width="100px">
          <el-input v-model="formData2.msg_name" disabled="true" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="留言内容" label-width="80px">
          <el-input type="textarea" :col="3" v-model="formData2.msg_con" autocomplete="off"></el-input>
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
  name: 'msg',
  components: {},
  props: {},
  data() {
    return {
      formData: {},
      formData2: {},
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
      vm.post(vm.$var.port + '/upMsg.php', params).then(function (res) {
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
    handleDelete(id) {
      let vm = this;
      let params = vm.extend({
        id: id,
        size: 10
      }, vm.formData);
      vm.post(vm.$var.port + '/delMsg.php', params).then(function (res) {
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
      vm.post(vm.$var.port + '/msg.php', params).then(function (res) {
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