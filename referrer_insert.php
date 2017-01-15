<?php
############################################
# ThaiRIS (Thai Radiology Information System)
# Version: 1.0
# File last modified: 14 Jan 2017
# File name: referrer_insert.php
# Description :  Insert new referrer to database get data from referrer_new.php
# http://www.thairis.net
# Email : info.xraythai@gmail.com
############################################
$centercode = $_POST['center_code'];
$code = trim($_POST['code']);
$degree = trim($_POST['degree']);
$name = trim($_POST['name']);
$lastname = trim($_POST['lastname']);
$email = trim($_POST['email']);
$fax = trim($_POST['fax']);
include "connectdb.php";

$sql_insert_refer = "insert INTO xray_referrer (REFERRER_ID,DEGREE, NAME,LASTNAME,CENTER_CODE,EMAIL,FAX)VALUES('$code','$degree','$name','$lastname','$centercode','$email','$fax')";
mysql_query($sql_insert_refer);
echo "Done";
?>

    <script>
        var timer = setTimeout(function() {
            window.location='referrer_new.php'
        }, 4000);
    </script>
