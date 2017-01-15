<?php
############################################
# ThaiRIS (Thai Radiology Information System)
# Version: 1.0
# File last modified: 14 Jan 2017
# File name: referrer_new.php
# Description : Form for create new referrer  
# http://www.thairis.net
# Email : info.xraythai@gmail.com
############################################
include "session.php";
include "connectdb.php";

?>
<!DOCTYPE HTML>
<html>
<head>
<title>Add New Referrer</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<script language=JavaScript src="frames_body_array_<?php  echo $LANGUAGE; ?>.js" type=text/javascript></script>
<script language=JavaScript src="mmenu.js" type=text/javascript></script>  
<body bgcolor="#d4d4d4">
<link href="css/main.css" rel="stylesheet" type="text/css" />
<?php
$topbar = "Add Referrer";
include "topbar.php";
?>
<form id="form1" name="form1" method="post" action="referrer_insert.php">
<table width="794" border="0" align=center bgcolor=#FFFFFF>
<tr><td bgcolor=#79acf3 colspan=2>Add New Referrer</td></tr>
  <tr>
    <td width="191"><font face="MS Sans Serif"><img src="icon/pen.gif" width="54" height="59" align="middle"> New Referrer </font></td>
	
    <td width="587" bgcolor="#f8d290">




<?php
			$sql2 ="select * FROM xray_center order by NAME";
			$result2 = mysql_query($sql2);
			echo "<div id='".$row['ORDERID']."'>\n";
			echo "Center Code: <select name=center_code id=select_center".$row['ORDERID'].">";
			echo "<option value=''>Select Center</option>\n";
			while ($row =mysql_fetch_array($result2))
				{
					echo "<option name=center_code value=".$row['CODE'];
					if ($row['CODE'] == $center_code)
						{ 
							echo " selected=selected "; 
						}   
					echo " >".$row['NAME']."</option>\n";
					echo $row['CODE']."VS".$center_code."<br>";
				}
				
				echo "<select></div>";

?>


<br />
   
  <p>CODE
    <label>
      <input type="text" name="code" id="code" /> 
    </label>
  </p>
    <p>Degree
    <label>
      <input type="text" name="degree" id="degree" /> 
    </label>
  </p>
  <p>Name 
    <label>
      <input type="text" name="name" id="name" />
Lastname 

      <input type="text" name="lastname" id="lastname" />
    </label>
  </p>
  <p>Email
    <label>
      <input type="text" name="email" id="email" />

Fax Number
    <label>
      <input type="text" name="fax" id="fax" />
    </label>
  </p>
  <p>
    <label>
      <input type="reset" name="clear" id="clear" value="Reset" />
    </label>
    <label>
      <input type="submit" name="button" id="button" value="Submit" />
    </label>
  </p>
  <p>&nbsp;</p>
  
  </form>
  
  </td></tr><table>
  
  
  </body></html>