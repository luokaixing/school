<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['msg_name'];
	$con=$_POST['msg_con'];
	$id=$_POST['msg_id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE leave_msg SET msg_name = '$name', msg_con = '$con' WHERE msg_id = '$id';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='留言信息修改成功';
		$port['status']='1';
		$port['data']='留言信息修改成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='留言信息修改失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>