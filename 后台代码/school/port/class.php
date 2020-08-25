<?php
    header('content-type:text/html;charset=utf-8');
  	include '../base.php';
	$class=$_POST['class'];
	$select_sql="SELECT * FROM user where class='$class'";
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