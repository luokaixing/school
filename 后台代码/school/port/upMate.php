<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['excellent_name'];
	$pos=$_POST['excellent_pos'];
	$con=$_POST['excellent_con'];
	$desc=$_POST['excellent_desc'];
	$id=$_POST['excellent_id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE excellent SET excellent_name = '$name', excellent_pos = '$pos', excellent_con = '$con' WHERE excellent_id = '$id';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='校友信息修改成功';
		$port['status']='1';
		$port['data']='校友信息修改成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='校友信息修改失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>