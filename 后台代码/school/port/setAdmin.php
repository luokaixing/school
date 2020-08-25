<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['class_no'];
	$id=$_POST['id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE user SET class_no = '$name' WHERE id = '$id';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='绑定成功';
		$port['status']='1';
		$port['data']='绑定成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='绑定失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>