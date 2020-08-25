import Vue from 'vue';
Vue.prototype.errorValidate = function (el) {
  let vm = this;
  setTimeout(() => {
    let $error = $('.el-form-item__error').eq(0);
    if ($error.css('display') == 'none') {
      $error = $('.el-form-item__error').eq(1);
    }
    vm.$message.error({
      showClose: true,
      message: $error.html(),
      type: 'error'
    });
    let siblings = $error.siblings();
    if (siblings.hasClass('el-select') || siblings.hasClass('el-date-editor--date') || siblings.find('.el-date-editor--date').length > 0) {
      siblings.eq(0).focus();
      let error = $error.siblings('.timeError');
      siblings.find('.timeError').focus();
      if (error.length == 0) {
        siblings.find('input').focus();
      }
    } else {
      siblings.find('input').focus();
      siblings.find('textarea').focus();
      siblings.find('button').focus();
    }
  }, 500);
};
Vue.prototype.allXinyong = (rule, value, callback) => {
  let integerReg = /^[0-9]*$/g;
  if (integerReg.test(value)) {
    callback();
  } else {
    return callback(new Error('请输入十位或十八位数字'));
  }
};