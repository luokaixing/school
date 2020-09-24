<?php
	error_reporting(0);
        header('content-type:text/html;charset=utf-8');
  	include '../base.php';
  	$name=$_POST['class_no'];
	$grade=$_POST['class_grade'];
	if(isset($name)){
        $select_sql="SELECT * FROM  class WHERE class_no='$name'";
	}
	if(isset($grade)){
        $select_sql="SELECT * FROM  class WHERE class_grade='$grade'";
	}
	if(!isset($grade) && !isset($name)){
		$select_sql="SELECT * FROM class";
	}
	$result_select=mysqli_query($conn, $select_sql);
	$rows = mysqli_num_rows($result_select);
	// print_r($rows);//8
	// echo '<br>';
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
