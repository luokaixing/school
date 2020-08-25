
<?php
  header('content-type:text/html;charset=utf-8');
  include '../base.php';
	$name=$_POST['username'];
	$pwd=$_POST['password'];
	$stuno=$_POST['stuno'];
	$class=$_POST['class'];
	$grade=$_POST['grade'];
	$gender=$_POST['gender'];
	$phone=$_POST['phone'];
	$birthday=$_POST['birthday'];
	$major=$_POST['major'];
	$address=$_POST['address'];
	$company=$_POST['company'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$update_sql = "UPDATE user SET password = '$pwd', stuno = '$stuno', class = '$class', grade = '$grade', gender = '$gender', phone = '$phone', birthday = '$birthday', major = '$major', address = '$address', company = '$company' WHERE username = '$name';";
	$result_update=mysqli_query($conn, $update_sql);
	if($result_update){
		$port['msg']='用户信息修改成功';
		$port['status']='1';
		$port['data']='用户信息修改成功';
		echo json_encode($port);
		exit;
	}else {
		$port['data']='用户信息修改失败';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>