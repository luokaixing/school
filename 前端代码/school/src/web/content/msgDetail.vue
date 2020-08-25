<template>
  <div class="wrapper">
    <el-page-header @back="$router.go(-1)" content="留言详情页面"></el-page-header>
    <h1 class="title">校友留言动态</h1>
    <el-divider><i class="el-icon-user"></i>{{articalInfo.msg_name}}</el-divider>
    <el-divider><i class="el-icon-time"></i>{{articalInfo.msg_time}}</el-divider>
    <el-row>
      {{articalInfo.msg_con}}
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'msgDetail',
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
    console.log(vm.articalInfo);
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