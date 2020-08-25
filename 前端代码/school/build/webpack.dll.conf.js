const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const config = require('../config');
const CleanWebpackPlugin = require('clean-webpack-plugin');
module.exports = {
  entry: {
    vendor: [
      // 'jquery',
      'vue',
      'vuex',
      'axios',
      'vue-router',
      'element-ui',
      'vue-wechat-title',
      'babel-polyfill'
    ]
  },
  output: {
    path: path.join(__dirname, '../static/dll'),
    filename: '[name].dll.[chunkhash].js',
    library: '[name]_library' // vendor.dll.js中暴露出的全局变量名
  },

  plugins: [
    new CleanWebpackPlugin({
      root: __dirname, // 根目录
      verbose: true, // 开启在控制台输出信息
      dry: false // 启用删除文件
    }),
    new webpack.DllPlugin({
      path: path.join(__dirname, '.', '[name]-manifest.json'),
      name: '[name]_library'
    }),
    new webpack.optimize.UglifyJsPlugin({
      compress: {
        warnings: false
      }
    }),
    new HtmlWebpackPlugin({
      filename: path.join(__dirname, '../', config.dev.index),
      template: 'index.ejs',
      inject: false
    })
  ]
};
