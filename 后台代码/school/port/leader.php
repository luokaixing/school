<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['leader_name'];
	$pos=$_POST['leader_pos'];
	$con=$_POST['leader_con'];
	$time=date("Y-m-d H:i:s");
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$insert_sql="INSERT INTO leader (leader_name,leader_pos,leader_con,leader_time) VALUES('$name', '$pos', '$con', '$time')";
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