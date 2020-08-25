<template>
  <div class="wrapper">
    <el-page-header @back="$router.go(-1)" content="校友信息详情页面"></el-page-header>
    <h1 class="title">学校校友信息</h1>
    <el-divider><i class="el-icon-user"></i>{{articalInfo.excellent_name}}</el-divider>
    <el-divider><i class="el-icon-time"></i>{{articalInfo.excellent_time}}</el-divider>
    <p style="text-align:center;margin:20px 0 20px 0;">{{articalInfo.excellent_desc}}</p>
    <p style="text-align:center;margin:0px 0 20px 0;">{{articalInfo.excellent_pos}}</p>
    <el-row>
      {{articalInfo.excellent_con}}
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'mateDetail',
  components: {},
  props: {},
  data() {
    return {
      articalInfo: {}
    };
  },
  watch: {},
  computed: {},
  methods: {},
  created() {},
  mounted() {
    let vm = this;
    vm.articalInfo = vm.$route.params.item;
  }
};
</script>
<style lang="less" scoped>
.wrapper{
  padding:30px;
  min-height:600px;
  .title{
    text-align:center;
  }
}
</style>