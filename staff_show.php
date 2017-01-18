<?php
include "connectdb.php";
$code = $_POST['code'];
$name = $_POST['name'];
$lastname = $_POST['lastname'];


//$result = mysql_query("SELECT * FROM xray_code WHERE (XRAY_CODE LIKE '%$code%') AND (DESCRIPTION LIKE '%$description%') AND (XRAY_TYPE_CODE LIKE '%$typecode%') AND DELETE_FLAG ='0'");
$result = mysql_query("SELECT * FROM xray_user WHERE (CODE LIKE '%$code%') AND (NAME LIKE '%$name%') AND (LASTNAME LIKE '%$lastname%') AND ENABLE ='1'");


?>
<!DOCTYPE html>
<html>
<head>
<title>Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<script language=JavaScript src="frames_body_array_<?php echo $LANGUAGE; ?>.js" type=text/javascript></script>
<script language=JavaScript src="mmenu.js" type=text/javascript></script>  
</head>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<?php
$topbar = "Staff Edit";
include "topbar.php";
?>
<body bgcolor="#d4d4d4">

<p>Staff </p>
<p>
<form name="searchcode" method="post" action="staff_show.php" accept-charset="UTF-8">
CODE <input type="text" name="code" id="textfield" />
NAME <input type="text" name="name" id="textfield2" />
LASTNAME <input type="text" name="lastname" id="textfield3" />
<input type="submit" name="button" id="button" value="Search" />
</p>

</form>
<?php
echo "<table border='0'>

<tr>
<th>Code</th>
<th>DF_CODE</th>
<th>LOGIN</th>
<th>NAME</th>
<th>LASTNAME</th>
<th>User Type</th>
<th>E</th>
<th>V</th>
</tr>\n";

$bg = '';
while($row = mysql_fetch_array($result))
	{ 
		if($bg == "#FFFFFF") 
			{ 
				$bg = "#EBEBEB";
			} 
		else 
			{
				$bg = "#FFFFFF";
			}
		echo "<tr bgcolor=$bg>";
		echo "<td>" . $row['CODE'] . "</td>";
		echo "<td>" . $row['DF_CODE'] . "</td>";
		echo "<td>" . $row['LOGIN'] . "</td>";
		echo "<td align=right>" . $row['NAME'] . "</td>";
		echo "<td align=right>" . $row['LASTNAME'] . "</td>";
		echo "<td align=right>" . $row['USER_TYPE_CODE'] . "</td>";
		echo "<td><a href=staff_edit.php?id=".$row['ID'].">Edit</a></td>";
		echo "<td><a href=staff-view.php?code=".$row['CODE'].">View</a></td>";
		echo "</tr>\n";
	}

echo "</table>";
echo "</body></html>";

?>
