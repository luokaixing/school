<template>
  <div class="hello">
    <h1>{{ date }}</h1>
    <!-- <h1 v-model="date | change"></h1> -->
    <!-- <input type="text" v-model=""> -->
    <h3 v-text="$t('login.title')"></h3>
    <el-button type="primary"  @click.native='langToggle'>EN/中</el-button>
  </div>
</template>
<script>
export default {
  name: 'HelloWorld',
  data() {
    return {
      msg: 'Welcome to Your Vue.js App',
      date: '2019-08-08'
    };
  },
  mounted() {
    // let vm = this;
    // vm.langToggle();
  },
  methods: {
    langToggle() {
      if (this.$i18n.locale == 'zh_cn') {
        this.$i18n.locale = 'en_us';
      } else {
        this.$i18n.locale = 'zh_cn';
      }
    }
  }
};

</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
