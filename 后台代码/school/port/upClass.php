<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$teacher=$_POST['class_teacher'];
	$grade=$_POST['class_grade'];
	$id=$_POST['class_id'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE class SET class_teacher = '$teacher', class_grade = '$grade' WHERE class_id = '$id';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='班级信息修改成功';
		$port['status']='1';
		$port['data']='班级信息修改成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='班级信息修改失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>