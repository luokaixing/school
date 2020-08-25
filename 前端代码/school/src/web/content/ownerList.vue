<template>
  <div class="wrapper">
    <el-row class="top_btn">
      <el-form :model="formData" label-width="60px"  id="formData" label-position="right" ref="formData">
        <el-row class="con_data">
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
          <el-col :span="6" class="btn-right">
            <el-form-item>
              <el-button type="primary" @click="initData()" icon="el-icon-search">查询</el-button>
              <el-button type="primary" @click="initData()" icon="el-icon-plus">创建班级</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-row>
    <el-col :span="24" class="table">
      <el-table  :data="tableData" border stripe v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)" empty-text="未查到相关校友信息" height="280">
        <el-table-column fixed type="index" label="行号" align="center"></el-table-column>
        <el-table-column prop="grade" label="年级" align="center"></el-table-column>
        <el-table-column prop="class" label="班级" align="center"></el-table-column>
        <el-table-column prop="classAdmin" label="班级管理员" align="center"></el-table-column>
        <el-table-column fixed="right" label="操作" align="center">
          <template slot-scope="scope">
            <el-button @click="handleDelete(scope.row.id)" type="danger" size="mini">删除</el-button>
            <el-button type="primary" size="mini" @click="update(scope.row)">修改班级信息</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-col>
    <el-col :span="24" class="myPage">
      <el-pagination @current-change="initData" background layout="prev, pager, next,jumper" :current-page="pager.current" :total="pager.total"></el-pagination>
    </el-col>
  </div>
</template>

<script>
export default {
  name: 'ownerList',
  components: {},
  props: {},
  data() {
    return {
      formData: {},
      loading: false,
      pager: {
        total: 100,
        current: 1
      },
      tableData: [{
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }, {
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }, {
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }, {
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }, {
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }, {
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }, {
        birthday: '2016-05-02',
        name: '王小虎',
        home: '上海市普陀区金沙江路 1518 弄',
        grade: '2016',
        class: '2016-4',
        phone: '12312312311',
        major: '软件工程',
        company: '中国银联',
        gender: '男'
      }]
    };
  },
  watch: {},
  computed: {},
  methods: {
    initData() {}
  },
  created() {},
  mounted() {}
};
</script>
<style lang="less" scoped>
.wrapper{
  .con_data{
    padding:30px;
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