<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['news_title'];
	$con=$_POST['news_con'];
	$id=$_POST['news_id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE news SET news_title = '$name', news_con = '$con' WHERE news_id = '$id';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='新闻信息修改成功';
		$port['status']='1';
		$port['data']='新闻信息修改成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='新闻信息修改失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>