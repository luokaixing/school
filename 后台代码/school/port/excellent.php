<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['excellent_name'];
	$pos=$_POST['excellent_pos'];
	$con=$_POST['excellent_con'];
	$desc=$_POST['excellent_desc'];
	$time=date("Y-m-d H:i:s");
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$insert_sql="INSERT INTO excellent (excellent_name,excellent_pos,excellent_time,excellent_con,excellent_desc) VALUES('$name', '$pos', '$time','$con','$desc')";
	$result_insert=mysqli_query($conn, $insert_sql);
	if($result_insert){
		$port['msg']='新增成功';
		$port['status']='1';
		$port['data']='新增成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='新增失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>