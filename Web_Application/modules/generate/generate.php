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
			init_var($message);	
			init_var($push);
			$dbh = cobalt_load_class('sms_in');
			//for( $i = 0; $i<5; $i++ ){
				$thearray = "";
				$anarray = "";
				$result = $dbh->execute_query('SELECT * FROM `sms_in` LIMIT 1')->result;
				$row = mysqli_fetch_assoc($result);
				$thearray = explode(',',$row['sms_text']);
				$anarray = explode(' ',$row['sent_dt']);


				$mysqli = new mysqli('localhost','root','','pureoxy');

				if($thearray[0] <= 450 AND $thearray[1] <= 30){
					$quality = "SAFE";
					$percentage = 20;
				}
				if($thearray[0] > 450 OR $thearray[0] <= 600 AND $thearray[1] > 30 OR $thearray[1] <= 70){
					$quality = "ACCEPTABLE";
					$percentage = 35;
				}
				if($thearray[0] > 600 OR $thearray[0] <= 1000 AND $thearray[1] > 70 OR $thearray[1] <= 100){
					$quality = "SUBPAR";
					$percentage = 50;
				}

				 $sql = "INSERT INTO air_data (quality, co2, co, percentage, time, date, module_id) " . "VALUES ('".$quality. "','" .$thearray[0]."','".$thearray[1]."','".$percentage."','".$anarray[1]."','".$anarray[0]."','" .$thearray[2]."')";

				  if ($mysqli->query($sql) === true){
      					
        				redirect(HOME_PAGE);
    					}
			//}
			
			if($message != ''){
				$message_type = 'error';
			}
			else
		{	
			redirect(HOME_PAGE);
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


	
	
