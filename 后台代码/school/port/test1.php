<?php
    header('content-type:text/html;charset=utf-8');
  	include '../base.php';
  	// $name='admin';
  	$name=$_POST['username'];
	$stuno=$_POST['stuno'];
	$class=$_POST['class'];
	$grade=$_POST['grade'];
	$phone=$_POST['phone'];
	$port=array('status'=>'0','msg'=>'error','data'=>'');
	if(isset($name)){
        $select_sql="SELECT * FROM  user WHERE username='$name'";
	}
	if(isset($grade)){
        $select_sql="SELECT * FROM  user WHERE grade='$grade'";
	}
	if(isset($class)){
        $select_sql="SELECT * FROM  user WHERE class='$class'";
	}
	if(isset($stuno)){
        $select_sql="SELECT * FROM  user WHERE stuno='$stuno'";
	}
	if(isset($phone)){
        $select_sql="SELECT * FROM  user WHERE phone='$phone'";
	}
	if(!isset($name) && !isset($stuno) && !isset($grade) && !isset($class) && !isset($phone)){
		$select_sql="SELECT * FROM  user";
	}
	$result_select=mysqli_query($conn, $select_sql);
	$rows = mysqli_num_rows($result_select);
	$i=0;
	$arr = array();
	while($i<$rows){
    	$row = mysqli_fetch_assoc($result_select);
    	$arr[$i]=$row;
	  	$i++;
	}
	echo json_encode($arr);
	mysqli_close($conn);
?>