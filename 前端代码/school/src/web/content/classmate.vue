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
            <el-form-item label="班级" prop="class">
              <el-input v-model="formData.class" placeholder="请输入班级" clearable></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="6" class="btn-right">
            <el-form-item>
              <el-button type="primary" @click="initData()" icon="el-icon-search">查询</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-row>
    <el-col :span="24" class="table">
      <el-table  :data="tableData" border stripe v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)" empty-text="未查到相关校友信息" height="280">
        <el-table-column fixed type="index" label="行号" align="center" width="50"></el-table-column>
        <el-table-column prop="username" fixed label="姓名" width="100" align="center"></el-table-column>
        <el-table-column prop="grade" label="年级" width="100" align="center"></el-table-column>
        <el-table-column prop="class" label="班级" width="100" align="center"></el-table-column>
        <el-table-column prop="phone" label="手机号码" width="150" align="center"></el-table-column>
        <el-table-column prop="gender" label="性别" width="100" align="center"></el-table-column>
        <el-table-column prop="major" show-overflow-tooltip label="专业" width="100" align="center"></el-table-column>
        <el-table-column prop="address" show-overflow-tooltip label="家庭住址" width="250" align="center"></el-table-column>
        <el-table-column prop="company" label="目前所在公司" width="150" align="center"></el-table-column>
        <el-table-column prop="birthday" label="出生日期" width="250" align="center"></el-table-column>
      </el-table>
    </el-col>
    <h1>您有可能认识的人</h1>
    <el-row class="mes_title">
      <el-col :span="6" class="con_center">姓名</el-col>
      <el-col :span="6" class="con_center">班级</el-col>
      <el-col :span="6" class="con_center">年级</el-col>
      <el-col :span="6" class="con_center">电话号码</el-col>
    </el-row>
    <vue-seamless-scroll :data="peopleList" class="seamless-warp" :class-option="classOption">
      <ul class="list_wrapper" style="padding-bottom:0px;">
        <li v-for="item in peopleList" :key="item.id"><el-row><el-col :span="6" class="mes_con con_center">{{item.username}}</el-col><el-col :span="6" class="mes_con con_center">{{item.class}}</el-col><el-col :span="6" class="con_center con_center">{{item.grade}}</el-col><el-col :span="6" class="con_center myPhone con_center"><i class="el-icon-phone" style="margin-right:10px;"></i>{{item.phone}}</el-col></el-row></li>
      </ul>
    </vue-seamless-scroll>
    <el-row style="height:30px;"></el-row>
  </div>
</template>

<script>
import vueSeamlessScroll from 'vue-seamless-scroll';
export default {
  name: 'classmate',
  components: {
    vueSeamlessScroll
  },
  props: {},
  data() {
    return {
      formData: {},
      loading: false,
      peopleList: [],
      tableData: []
    };
  },
  watch: {},
  computed: {
    classOption () {
      return {
        step: 0.2, // 数值越大速度滚动越快
        limitMoveNum: 2, // 开始无缝滚动的数据量 this.dataList.length
        hoverStop: true, // 是否开启鼠标悬停stop
        direction: 1, // 0向下 1向上 2向左 3向右
        openWatch: true, // 开启数据实时监控刷新dom
        singleHeight: 0, // 单步运动停止的高度(默认值0是无缝不停止的滚动) direction => 0/1
        singleWidth: 0, // 单步运动停止的宽度(默认值0是无缝不停止的滚动) direction => 2/3
        waitTime: 1000 // 单步运动停止的时间(默认值1000ms)
      };
    }
  },
  methods: {
    init() {
      let vm = this;
      vm.initData();
    },
    initData(page) {
      let vm = this;
      let params = vm.extend({
        current: page || 1,
        size: 10,
        grade: vm.$store.state.userInfo.grade
      }, vm.formData);
      vm.loading = true;
      vm.post(vm.$var.port + '/classmate.php', params).then(function (res) {
        vm.loading = false;
        vm.tableData = res;
      }, function () {
        vm.loading = false;
      });
      let params1 = vm.extend({
        current: page || 1,
        size: 10,
        class: vm.$store.state.userInfo.class
      }, vm.formData);
      vm.post(vm.$var.port + '/class.php', params1).then(function (res) {
        vm.loading = false;
        vm.peopleList = res;
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
    padding:30px;
  }
  h1{
    font-size:20px;
    color:#9B9B9B;
    border-bottom:2px solid #b6c29a;
    font-weight:600;
    margin:30px;
  }
  .seamless-warp {
    height: 280px;
    overflow: hidden;
  }
  .list_wrapper{
    padding:0 30px 30px 30px;
    li{
      width:100%;
      padding:5px 0;
      overflow: hidden;
    }
    li:nth-child(2n){
      background: #f1f1f1;
    }
    li:hover{
      opacity:0.8;
    }
    .title{
      width:80%;
      float:left;
      overflow: hidden;
      text-overflow:ellipsis;
      white-space: nowrap;
      font-weight:500;
      font-size:18px;
    }
    .time{
      width:18%;
      float:right;
      font-size:16px;
      color:#9b9b9b;
    }
  }
  .con_center{
    text-align:center;
  }
  .mes_title{
    padding:10px 0;
    margin:0 30px;
    background: #f1f1f1;
    font-size:20px;
    font-weight:600;
  }
  .mes_con{
    overflow: hidden;
    text-overflow:ellipsis;
    white-space: nowrap;
    font-weight:500;
    font-size:18px;
  }
  .myPhone{
    color:#9b9b9b;
  }
}
.table{
  padding:30px;
}
.top_btn{
  border-bottom:1px solid #cdcdcd;
}
</style>