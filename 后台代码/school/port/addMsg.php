<?php
header('content-type:text/html;charset=utf-8');
include '../base.php';
$con=$_POST['textarea'];
$name=$_POST['username'];
$time=date("Y-m-d");
$port=array('status'=>'0','msg'=>'error','data'=>'');
$insert_sql="INSERT INTO leave_msg (msg_con,msg_name,msg_time) VALUES('$con', '$name', '$time')";
$result_insert=mysqli_query($conn, $insert_sql);
if($result_insert){
$port['msg']='提交成功';
$port['status']='1';
$port['data']='提交成功';
echo json_encode($port);
exit;
}else {
$port['data']='提交失败';
echo json_encode($port);
exit;
}
mysqli_close($conn);
?>