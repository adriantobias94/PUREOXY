<?php
require 'path.php';
init_cobalt('generate');

if(xsrf_guard()){

	init_var($_POST['btn_cancel']);
	init_var($_POST['btn_submit']);


	if($_POST['btn_cancel'])
	{	
		redirect(HOME_PAGE);
	}

		if($_POST['btn_submit'])
		{

			 $hostdb = "localhost";  // MySQl host
   			 $userdb = "root";  // MySQL username
    		 $passdb = "";  // MySQL password
  			 $namedb = "pureoxy";  // MySQL database name

      $dbhandle = new mysqli($hostdb, $userdb, $passdb, $namedb);
      
      $countSearch = "SELECT COUNT(*) FROM sms_in";
      $result2 = $dbhandle->query($countSearch) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");

      $key = mysqli_fetch_array($result2);
      $id = $key['COUNT(*)'];

      for($i = 0; $i<$id; $i++){
			init_var($message);	
			init_var($push);
			$dbh = cobalt_load_class('sms_in');
				$thearray = "";
				$anarray = "";
				$result = $dbh->execute_query('SELECT * FROM `sms_in` LIMIT 1')->result;
				$row = mysqli_fetch_assoc($result);
				$thearray = explode(',',$row['sms_text']);
				$anarray = explode(' ',$row['sent_dt']);


				$mysqli = new mysqli('localhost','root','','pureoxy');


				if($thearray[0] <= 100 AND $thearray[1] <= 100){
					$quality = "SAFE";
					$percentage = 20;
				}
				if($thearray[0] >  100 AND $thearray[0] <= 300 OR $thearray[1] > 100 AND $thearray[1] <= 300){
					$quality = "DANGEROUS";
					$percentage = 35;
				}
				if($thearray[0] > 600 AND $thearray[0] <= 1000 AND $thearray[1] > 70 AND $thearray[1] <= 100){
					$quality = "SUBPAR";
					$percentage = 50;
				}

				 $sql = "INSERT INTO air_data (quality, co2, co, percentage, time, date, module_id) " . "VALUES ('".$quality. "','" .$thearray[0]."','".$thearray[1]."','".$percentage."','".$anarray[1]."','".$anarray[0]."','" .$thearray[2]."')";

				  if ($mysqli->query($sql) === true){
      					
				  	$deleteQuery = "DELETE FROM sms_in WHERE id = '".$row['id']."'";
					
					$mysqli->query($deleteQuery);

			}
			
	
		
	}
		
	}
}


$html = cobalt_load_class('air_data_html');
$html->draw_header('Generate Data', $message, $message_type);

$html->draw_container_div_start();
$html->draw_fieldset_header('Generate Data');
$html->draw_fieldset_body_start();
echo '<table>';

echo '<tr><td>';
echo '<h1>Click Submit to sort data!</h1>';
echo '</td></tr>';
echo '</table>';
$html->draw_fieldset_body_end();
$html->draw_fieldset_footer_start();
$html->draw_submit_cancel();
$html->draw_fieldset_footer_end();
$html->draw_container_div_end();


	
	
