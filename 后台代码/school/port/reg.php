<?php
header('content-type:text/html;charset=utf-8');
include '../base.php';
$name=$_POST['username'];
$pwd=$_POST['password'];
$stuno=$_POST['stuno'];
$class=$_POST['class'];
$grade=$_POST['grade'];
$gender=$_POST['gender'];
$phone=$_POST['phone'];
$birthday=$_POST['birthday'];
$major=$_POST['major'];
$address=$_POST['address'];
$company=$_POST['company'];
$create_time=date("Y-m-d H:i:s");
$port=array('status'=>'0','msg'=>'error','data'=>'');
$sql="SELECT username FROM user WHERE username='$name'";
$result=mysqli_query($conn, $sql);
$num = mysqli_num_rows($result); 
if($num){
	$port['data']='用户名已存在,注册失败';
	echo json_encode($port);
 	exit;
}
$insert_sql="INSERT INTO user (username,password,grade,class,stuno,gender,phone,birthday,major,address,company,create_time) VALUES('$name', '$pwd', '$grade', '$class', '$stuno', '$gender', '$phone', '$birthday', '$major', '$address', '$company', '$create_time')";
$result_insert=mysqli_query($conn, $insert_sql);
if($result_insert){
	$port['msg']='注册成功';
	$port['status']='1';
	$port['data']='注册成功';
	echo json_encode($port);
	exit;
}else {
	$port['data']='注册失败';
	echo json_encode($port);
 	exit;
}
mysqli_close($conn);
?>