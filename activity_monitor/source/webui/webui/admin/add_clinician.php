<?php session_start();

// check to see if $_SESSION['dashboard_timeout'] is set
if(isset($_SESSION["timeout"]) ) {
        $session_life = time() - $_SESSION["timeout"];
        if($session_life > $_SESSION["inactive_time"])
        { session_destroy(); header("Location: logout.php?error=102"); }
}
$_SESSION["timeout"] = time();

if($_SESSION["loggedin"] == "")
{
 header("Location: logout.php?error=103");
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Add Clinician</title>
<link rel="stylesheet" type="text/css" href="styles.css" />
</head>

<body>
  
<div id="fullwrapper">
           
	<div id="header">		 
		<h1>Activity Monitor</h1>			 
	</div>
  
	<div id="bottomwrapper"> 
      
      	<div id="columnwrapper0">
    		<div id="leftminibar"></div>
    		<div id="leftcolumn"> 
    			<font size=5><u>Menu</u></font><br /><br />
    			<a href="homepage.php">Home</a><br />
	  			<a href="clinicians.php">List Clinicians</a><br />
	  			<a href="add_clinician.php">Add Clinician</a><br />
	  			<a href="logout.php">Logout</a>
    		</div>
        </div>
        
        <div id="columnwrapper">
 	   
 		  	<div id="breadcrumbs">
			
  			</div>
  
   			<div id="content">
   				<h2 class="welcome">Add Patient</h2>
   				<br />
   			<?php
				if($_GET["error"] == 101)
				{
			?>
				<table class="error" bgcolor="red">
				<tr>
				<td size=>User was not added to the database.</td>
				</tr>
				</table>
			<?php
				}
			?>
			
			<?php
				if($_GET["error"] == 102)
				{
			?>
				<table class="error" bgcolor="red">
				<tr>
				<td size=>All fields are Required!</td>
				</tr>
				</table>
			<?php
				}
			?>
			<?php
				if($_GET["error"] == 103)
				{
			?>
				<table class="error" bgcolor="red">
				<tr>
				<td size=>Username Already Taken!</td>
				</tr>
				</table>
			<?php
				}
			?>
				<h3>Please enter all fields.</h3>
				<br />
   				<form name="add clinician" action="clinician_script.php" method="post">
   				First name: <input type="text" name="firstname" /><br />
   				Middle name: <input type="text" name="middlename" /><br />
   				Last name: <input type="text" name="lastname" /><br />
   				Username: <input type="text" name="username" /><br />
   				Password: <input type="text" name="password" /><br />
   				Address: <input type="text" name="address" /><br />
   				Phone Number: <input type="text" name="phone" />
   				<br /><br />
   				<input type="submit" value="Submit">
   				</form>
   			
			</div>

		</div> <!-- End columnwrapper -->  
	</div> <!-- End bottomwrapper -->

	<div id="footer">   
       This is the Footer		
	</div>				 
</div> <!-- End fullwrapper -->
  
</body>
</html>