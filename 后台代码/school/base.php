<?php
	header("Content-type:text/html;charset=utf-8");
	$host='localhost';
	$userName='root';
	$passWorld='root';
	$dbName='school';

	$conn=mysqli_connect($host,$userName,$passWorld,$dbName);
	mysqli_query($conn,'set names utf8');
	if(mysqli_connect_errno()){
	  die('数据库连接失败！'.mysqli_connect_errno());
	}else{
	  // echo '<h2>恭喜，数据库连接成功！用户：ROOT,数据库：school</h2>';
	  // echo "success";
	}
?>