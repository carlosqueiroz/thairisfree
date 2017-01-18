<?php
header("Content-type: text/html;  charset=TIS-620");
include "connectdb.php";

mysql_select_db($dbname,$dbconnect);

$ID = $_POST['ID'];
$CODE = $_POST['CODE'];
$DF_CODE = $_POST['DFCODE'];
$LOGIN = $_POST['LOGIN'];
$NAME = $_POST['NAME'];
$LASTNAME = $_POST['LASTNAME'];
$USER_TYPE_CODE = $_POST['USER_TYPE_CODE'];
$PREFIX = $_POST['PREFIX'];
$CENTER_CODE = $_POST['CENTER_CODE'];
$PACS_LOGIN = $_POST['PACS_LOGIN'];



$sql = "UPDATE xray_user SET CODE='$CODE', DF_CODE='$DF_CODE', LOGIN='$LOGIN', NAME='$NAME', LASTNAME='$LASTNAME', USER_TYPE_CODE='$USER_TYPE_CODE'
		, PREFIX='$PREFIX', PACS_LOGIN='$PACS_LOGIN' where ID='$ID'";
mysql_query($sql);
		echo "<body bgcolor=\"#d4d4d4\">";
		echo "<meta http-equiv=\"refresh\" content=\"2;url=admin.php\" />";
		echo "<center> Staff Updated</center>";
?>
