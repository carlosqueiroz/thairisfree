function reporting(ORDERID,RADID)
{
var arrive;
var ID;
var TYPE;
var IDD = "ID=";
var AAND = "&";
var HHN = "HN=";
var TTYPE = "TYPE=";

try
  {
  // Firefox, Opera 8.0+, Safari
  arrive=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    arrive=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      arrive=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  arrive.onreadystatechange=function()
    {
    if(arrive.readyState==4)
      {
    //  var resultarea = document.getElementById(ID);
 // resultarea.innerHTML = arrive.responseText;
      }
    }
//req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=tis-620"); // set Header
arrive.open("GET","dictate.php?"+IDD+ID+AAND+TTYPE+TYPE+AAND+Math.random(),true);
arrive.send(null);
  }


<!-- //////////////////////////// Function 2 ----------------------->
