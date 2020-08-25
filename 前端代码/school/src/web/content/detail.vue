<template>
  <div class="wrapper">
    <el-page-header @back="$router.go(-1)" content="新闻详情页面"></el-page-header>
    <h1 class="title">校内最新新闻动态</h1>
    <el-divider><i class="el-icon-user"></i>{{articalInfo.news_title}}</el-divider>
    <el-divider><i class="el-icon-time"></i>{{articalInfo.news_time}}</el-divider>
    <el-row>
      {{articalInfo.news_con}}
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'detail',
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