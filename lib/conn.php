<?php 
$connect = new mysqli("localhost:3306","menc2839_user","Menuku123!123","menc2839_flutterlogin");
if($connect){
	//echo "connection success";
}
else
{
	echo "Connection Failed";
	exit();
}
header('content-type: application/json');
 ?>