<template>
  <div class="wrapper">
    <el-page-header @back="$router.go(-1)" content="领导信息详情页面"></el-page-header>
    <h1 class="title">学校领导信息</h1>
    <el-divider><i class="el-icon-user"></i>{{articalInfo.leader_name}}</el-divider>
    <el-divider>{{articalInfo.leader_pos}}</el-divider>
    <el-row>
      {{articalInfo.leader_con}}
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'leaderDetail',
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