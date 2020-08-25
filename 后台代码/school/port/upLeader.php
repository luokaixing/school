<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['leader_name'];
	$pos=$_POST['leader_pos'];
	$con=$_POST['leader_con'];
	$id=$_POST['leader_id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE leader SET leader_name = '$name', leader_pos = '$pos', leader_con = '$con' WHERE leader_id = '$id';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='领导信息修改成功';
		$port['status']='1';
		$port['data']='领导信息修改成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='领导信息修改失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>