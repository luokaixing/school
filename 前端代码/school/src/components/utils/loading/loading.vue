<template>
  <Spin fix v-show='isLoading'>
    <Icon type="ios-loading" size="18"></Icon>
    <div>加载中...</div>
  </Spin>
</template>
<script>
export default {
  name: 'loading',
  props: ['loadingshow'],
  data() {
    return {
      isLoading: this.loadingshow
    };
  },
  methods: {},
  watch: {
    loadingshow: function(val, oldval) {
      var vm = this;
      if (val != undefined) {
        vm.isLoading = true;
        val.then(function() {
          vm.isLoading = false;
        });
      }
    }
  }
};

</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
