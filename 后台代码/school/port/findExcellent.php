<?php
    header('content-type:text/html;charset=utf-8');
  	include '../base.php';
	$select_sql="SELECT * FROM excellent order by excellent_time limit 5";
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