<template>
  <el-row class="wrapper"  v-loading="fullscreenLoading">
    <el-row>
      <h1>校内新闻动态</h1>
      <ul class="list_wrapper" style="min-height:370px;" v-loading="loading" element-loading-text="拼命加载中" element-loading-spinner="el-icon-loading" element-loading-background="rgba(0, 0, 0, 0.8)">
        <li v-for="item in newsList" :key="item.id" @click="toDetail(item)"><span class="title">{{item.news_title}}</span><span class="time">{{item.news_time}}<i class="el-icon-right" style="margin-left:10px;"></i></span></li>
      </ul>
      <el-col :span="24" class="myPage">
        <el-pagination @current-change="handleCurrentChange" :page-size="limit" background layout="total, prev, pager, next,jumper" :current-page="pager.current" :total="pager.total"></el-pagination>
      </el-col>
      <h1>最新校友留言</h1>
      <el-row class="mes_title">
        <el-col :span="8" class="con_center">留言内容</el-col>
        <el-col :span="8" class="con_center">姓名</el-col>
        <el-col :span="8" class="con_center">时间</el-col>
      </el-row>
      <vue-seamless-scroll :data="messageList" class="seamless-warp" :class-option="classOption">
        <ul class="list_wrapper" style="padding-bottom:0px;">
          <li v-for="item in messageList" :key="item.id" @click="toMsg(item)"><el-row><el-col :span="8" class="mes_con">{{item.msg_con}}</el-col><el-col :span="8" class="con_center">{{item.msg_name}}</el-col><el-col :span="8" class="con_center myTime">{{item.msg_time}}<i class="el-icon-right" style="margin-left:10px;"></i></el-col></el-row></li>
        </ul>
      </vue-seamless-scroll>
      <h1>我也来留言板留言</h1>
      <el-col :span="20" style="padding:0 30px;">
        <el-input
          type="textarea"
          :rows="8"
          placeholder="请输入内容"
          v-model="textarea">
        </el-input>
      </el-col>
      <el-col :span="24" style="padding:30px 30px;">
        <el-button type="primary" class="btn_width" @click="addNews">提交</el-button>
      </el-col>
    </el-row>
  </el-row>
</template>

<script>
import vueSeamlessScroll from 'vue-seamless-scroll';
export default {
  name: 'newscenter',
  components: {
    vueSeamlessScroll
  },
  props: {},
  data() {
    return {
      newsList: [],
      messageList: [],
      myData: [],
      limit: 10,
      pager: {
        total: 0,
        current: 1
      },
      textarea: '',
      loading: false,
      fullscreenLoading: false
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
    handleCurrentChange(val) {
      this.pager.current = val;
      this.newsList = this.myData.filter((item, index) =>
        index < this.pager.current * 10 && index >= 10 * (this.pager.current - 1)
      );
    },
    toMsg(item) {
      let vm = this;
      vm.$router.push({name: 'msgDetail',
        params: {item: item}
      });
    },
    toDetail(item) {
      let vm = this;
      vm.$router.push({name: 'detail',
        params: {item: item}
      });
    },
    initData(page) {
      let vm = this;
      vm.post(vm.$var.port + '/news.php', {}).then(function (res) {
        vm.pager.total = res.length;
        vm.pager.current = 1;
        vm.myData = res;
        vm.handleCurrentChange(1);
      }, function () {});
      vm.post(vm.$var.port + '/msg.php', {}).then(function (res) {
        vm.messageList = res;
      }, function () {});
    },
    addNews() {
      let vm = this;
      let params = vm.extend({
        username: vm.$store.state.userInfo.username,
        textarea: vm.textarea
      });
      if (vm.textarea) {
        vm.fullscreenLoading = true;
        vm.post(vm.$var.port + '/addMsg.php', params).then(function (res) {
          vm.$message({
            message: '操作成功!',
            type: 'success'
          });
          vm.textarea = '';
          vm.initData();
          setTimeout(() => {
            vm.fullscreenLoading = false;
          }, 2000);
        }, function () {});
      } else {
        vm.fullscreenLoading = false;
        vm.$message({
          message: '请输入留言内容后再提交!',
          type: 'error'
        });
      }
    }
  },
  created() {},
  mounted() {
    let vm = this;
    vm.init();
    vm.handleCurrentChange(1);
  }
};
</script>
<style lang="less" scoped>
.wrapper{
  h1{
    font-size:20px;
    color:#9B9B9B;
    border-bottom:2px solid #b6c29a;
    font-weight:600;
    margin:30px;
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
}
.myPage{
  text-align:center;
  margin:30px 0;
}
.seamless-warp {
  height: 360px;
  overflow: hidden;
}
.btn_width{
  width:150px;
}
.con_center{
  text-align:center;
}
.mes_con{
  overflow: hidden;
  text-overflow:ellipsis;
  white-space: nowrap;
  font-weight:500;
  font-size:18px;
}
.mes_title{
  padding:10px 0;
  background: #f1f1f1;
  font-size:20px;
  font-weight:600;
}
.myTime{
  font-size:16px;
  color:#9b9b9b;
}
</style>