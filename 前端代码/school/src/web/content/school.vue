<template>
  <div class="wrapper">
    <el-row class="back_div"></el-row>
    <el-row class="school_title">学校现任领导及职位展示</el-row>
    <el-row class="card">
      <el-carousel :interval="4000" type="card" height="200px">
        <el-carousel-item class="card_item" v-for="(item,index) in swiperList" :key="item+index" @click.native="toLeader(item)">
          <div class="name">姓名: {{item.leader_name}}</div>
          <img :src="item.leader_id > 6?require(`@/assets/005.jpg`):require(`@/assets/00${item.leader_id}.jpg`)">
          <div class="location">现任职位: {{item.leader_pos}}</div>
        </el-carousel-item>
      </el-carousel>
    </el-row>
    <el-row class="back_div"></el-row>
    <el-row class="school_title">优秀毕业校友风采展示</el-row>
    <el-row class="person_list">
      <ul>
        <li v-for="(item, index) in excellent" :key="item+index" @click="toMate(item)">
          <div class="left"><img :src="item.excellent_id > 5 ?require(`@/assets/5.jpg`):require(`@/assets/${item.excellent_id}.jpg`)"></div>
          <div class="right">
            <p><el-link :underline="false" type="primary">{{item.excellent_name}}</el-link></p>
            <p>{{item.excellent_desc}}</p>
            <p>{{item.excellent_pos}}</p>
          </div>
        </li>
      </ul>
    </el-row>
    <el-row class="back_div"></el-row>
    <el-row class="school_title">校园优美风光展示</el-row>
    <el-row :span="20" :offset="2" class="school_wrapper" v-if="srcList.length">
      <div class="demo-image__preview" style="margin-left:65px;" v-for="item in srcList" :key="item.id">
        <el-image
          style="width: 100px;"
          class="big_img"
          :src="item.imgSrc"
          lazy
          :preview-src-list="srcList.map(list => list.imgSrc)">
        </el-image>
      </div>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'school',
  components: {},
  props: {},
  data() {
    return {
      swiperList: [],
      srcList: [
        {
          id: 10001,
          imgSrc: require('../../assets/xiaxue.jpg')
        },
        {
          id: 10002,
          imgSrc: require('../../assets/beiqu.jpg')
        },
        {
          id: 10003,
          imgSrc: require('../../assets/guangchang.jpg')
        },
        {
          id: 10004,
          imgSrc: require('../../assets/holeschool.jpg')
        },
        {
          id: 10005,
          imgSrc: require('../../assets/kongmuhu.jpg')
        },
        {
          id: 10006,
          imgSrc: require('../../assets/qiao.jpg')
        },
        {
          id: 10007,
          imgSrc: require('../../assets/school.jpg')
        },
        {
          id: 10008,
          imgSrc: require('../../assets/tushuguan.jpg')
        }
      ],
      excellent: []
    };
  },
  watch: {},
  computed: {},
  methods: {
    toLeader(item) {
      let vm = this;
      vm.$router.push({name: 'leaderDetail',
        params: {item: item}
      });
    },
    toMate(item) {
      let vm = this;
      vm.$router.push({name: 'mateDetail',
        params: {item: item}
      });
    },
    getInit() {
      let vm = this;
      vm.post(vm.$var.port + '/findLeader.php', {}).then(function (res) {
        vm.swiperList = res;
      }, function (res) {});
    },
    getExcellent() {
      let vm = this;
      vm.post(vm.$var.port + '/findExcellent.php', {}).then(function (res) {
        vm.excellent = res;
      }, function (res) {});
    }
  },
  created() {},
  mounted() {
    let vm = this;
    vm.getInit();
    vm.getExcellent();
  }
};
</script>
<style lang="less" scoped>
.back_div{
  width:100%;
  height:20px;
  background: #f1f1f1;
}
.school_title{
  text-align: center;
  height: 50px;
  line-height:50px;
  font-weight: 600;
  // color:#d3dce6;
  opacity: 0.7;
}
.card{
  .card_item{
    padding-left:125px;
  }
  img{
    height:200px;
    width:160px;
    display:inline-block;
    text-align:center;
    vertical-align: top;
    margin-left:20px;
    margin-right:20px;
  }
  .name,.location{
    color:white;
    font-weight:500;
    font-size:24px;
    vertical-align: top;
    display: inline-block;
    height:200px;
    line-height:200px;
  }
}
.person_list{
  padding:0 50px;
  overflow: hidden;
  li{
    padding-bottom:10px;
  }
  li:nth-child(2n){
    background: #f1f1f1;
  }
  li:hover{
    background: #f1f1f1;
    opacity: 0.7;
  }
  .left{
    display:inline-block;
    vertical-align: middle;
    width:100px;
    height:100px;
    overflow:hidden;
    img{
      width:98px;
      height:98px;
      object-fit: contain;
    }
    img:hover{
      transform: scale(1.2);
    }
  }
  .right{
    padding:10px 30px;
    display:inline-block;
    vertical-align: middle;
    width:calc(100% - 150px);
    height:100px;
    p{
      padding:0 0 5px 0;
      color:#9b9b9b;
    }
    p:last-child{
      width:calc(100% - 150px);
      white-space:nowrap;
      overflow:hidden;
      text-overflow:ellipsis;
    }
  }
}
.demo-image__preview{
  display:inline-block;
}
.school_wrapper{
  overflow-x: scroll;
  width:100%;
  margin-bottom:30px;
}
// 轮播背景
.el-carousel__item:nth-child(2n) {
  background: rgba(0,0,0,0.9);
}
.el-carousel__item:nth-child(2n+1) {
  background: rgba(0,0,0,0.9);
}
</style>