<?php
  header('content-type:text/html;charset=utf-8');
  include './base.php';
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	$select_sql="SELECT * FROM  user";
	$result_select=mysqli_query($conn, $select_sql);
	$rows = mysqli_num_rows($result_select);
	print_r($rows);//8
	echo '<br>';
	$i=0;
	while($i<$rows){
    	$row = mysqli_fetch_array($result_select);
	  	echo json_encode($row);
	  	$i++;
	}
	$my=mysqli_fetch_assoc($result_select);
	if($my){
		$port['msg']='登录成功！';
		$port['data']=$my;
		echo json_encode($port);
	 	exit;
	}else{
		$port['msg']='用户名或密码错误！';
		echo json_encode($port);
	 	exit;
	}
	mysqli_close($conn);
?>