<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['class_no'];
	$teacher=$_POST['class_teacher'];
	$grade=$_POST['class_grade'];
	$time=date("Y-m-d H:i:s");
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$sql="SELECT username FROM user WHERE username='$name'";
	$result=mysqli_query($conn, $sql);
	$num = mysqli_num_rows($result); 
	if($num){
		$port['data']='班级已存在,新增失败';
		echo json_encode($port);
	 	exit;
	}
	$insert_sql="INSERT INTO class (class_no,class_teacher,class_grade,class_time) VALUES('$name', '$teacher', '$grade', '$time')";
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