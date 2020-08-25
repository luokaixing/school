<template>
  <div class="error">
    404 页面不存在，请先检查路径是否写对！
  </div>
</template>
<script>
export default {
  name: 'error',
  data() {
    return {
      loadingshow: false
    };
  },
  destroyed() {
    let vm = this;
    console.log(vm);
  },
  mounted() {
    var vm = this;
    console.log(vm);
  },
  methods: {}
};

</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="less" scoped>
</style>
