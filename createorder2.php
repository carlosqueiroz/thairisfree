<?php
//header("Content-type: text/html;  charset=TIS-620");
include ("session.php");
include "connectdb.php";
?>
<!DOCTYPE html>
<html>
<head>
<title>Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body>

<?php

// Query Procedure
$TYPE = $_GET['TYPE'];
$HN = $_GET['HN'];
$REFERRER = $_GET['REFERRER'];
$DEPARTMENT = $_GET['DEPARTMENT'];

if ($REFERRER == '')
	{
		echo "Please Select Physician";
		exit;
	}
if ($DEPARTMENT == '')
	{
		echo "Please Select Department";
		exit;
	}
//echo "MRN=".$HN;
//echo "<br />Physician : ".$REFERRER;
//echo "<br />Department : ".$DEPARTMENT;

$sql = "select * FROM xray_code WHERE XRAY_TYPE_CODE = '$TYPE' LIMIT 0,15" ;
$result = mysql_query($sql);

echo "<table border='0' width=100%>

<tr bgcolor=#79acf3>
<th>Code</th>
<th>Procedure</th>
<th>Type</th>
<th>Price</th>
<th>Select</th>
</tr>\n";

//$row1 = mysql_fetch_array($result);
//if ($row1 < 0) {
//exit;
//}

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
  echo "<td>" . $row['XRAY_CODE'] . "</td>";
  echo "<td>" . $row['DESCRIPTION'] . "</td>";
  echo "<td>" . $row['XRAY_TYPE_CODE'] . "</td>";
  echo "<td align=right>" . $row['CHARGE_TOTAL'] . "</td>";
  //echo "<td><input type=\"submit\" name=\"pselect\" id=\"pselect\" value=\"Select\" onclick=create('".$row['XRAY_CODE']."') /></td>";
  echo "<td><input type=\"submit\" name=\"pselect\" id=\"pselect\" value=\"Select\" onclick=add_cart('".$HN."','".$row['XRAY_CODE']."')></td>";
  echo "</tr>\n";
  }

echo "</table>";
//echo "Type = ".$TYPE;
//echo "User = ".$username;
?>

</body>
</html>
