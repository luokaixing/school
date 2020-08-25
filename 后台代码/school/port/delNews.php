<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$id=$_POST['id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "DELETE from news where news_id='$id'";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='删除成功';
		$port['status']='1';
		$port['data']='删除成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='删除失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>