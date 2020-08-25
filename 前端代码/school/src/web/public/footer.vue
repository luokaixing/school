<template>
  <el-row class="footer">
    <el-row>
      <svg class="wave-container" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28" preserveAspectRatio="none">
        <defs>
          <path id="gentle-wave" d="M-160 44c30 0
        58-18 88-18s
        58 18 88 18
        58-18 88-18
        58 18 88 18
        v44h-352z">
        </path>
        </defs>
        <g class="parallax">
          <use xlink:href="#gentle-wave" x="50" y="0" fill="rgba(224,233,239,.5)"></use>
          <use xlink:href="#gentle-wave" x="50" y="3" fill="rgba(224,233,239,.5)"></use>
          <use xlink:href="#gentle-wave" x="50" y="6" fill="rgba(224,233,239,.5)"></use>
        </g>
      </svg>
    </el-row>
    <el-row class="footer_content">
      <el-col :span="8">
        <img src="../../assets/ecjtu.jpg" class="footer_img">
      </el-col>
      <el-col :span="8" class="word">
        <span class="el-icon-phone"></span>
        0976-3477744
        <span class="el-icon-location"></span>
        江西省南昌市青山湖区
        <!-- <span>版权所有 © 华东交通大学 京ICP备121212111号</span> -->
      </el-col>
      <el-col :span="8" class="p_center">
        校训：日新其德，止于至善
      </el-col>
    </el-row>
  </el-row>
</template>

<script>
export default {
  components: {},
  props: {},
  data() {
    return {
    };
  },
  watch: {},
  computed: {},
  methods: {},
  created() {},
  mounted() {}
};
</script>
<style lang="less" scoped>
.footer{
  width:100%;
  height:200px;
  background-image: url(../../assets/bg.jpg);
  background-repeat: no-repeat;
  background-size: cover;
}
.footer_img{
  width:168px;
  line-height:100px;
  margin-top:20px;
}
.footer_content{
  height:100px;
  padding:0 30px;
  background: rgba(0,0,0,0.5);
}
.word{
  display:inline-block;
  text-align:center;
  line-height:100px;
  color:white;
  font-size:18px;
}
.p_center{
  text-align:center;
  line-height:100px;
  color:white;
  font-size:18px;
}
// svg波浪
.wave-container{
  width: 100%;
  height: 100px;
}
.parallax>use {
  animation: wave-move 12s linear infinite
}
.parallax>use:nth-child(1) {
  animation-delay: -2s
}
.parallax>use:nth-child(2) {
  animation-delay: -2s;
  animation-duration: 5s
}
.parallax>use:nth-child(3) {
  animation-delay: -4s;
  animation-duration: 3s
}
@keyframes wave-move {
  0% {
    transform: translate(-90px,0)
  }
  100% {
    transform: translate(85px,0)
  }
}
</style>