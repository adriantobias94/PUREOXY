<?php
function monthFind($month){
      switch($month){
        case "01": $monthLabel = "Jan";
                  break;
        case "02": $monthLabel = "Feb";
                  break;
        case "03": $monthLabel = "Mar";
                  break;
        case "04": $monthLabel = "Apr";
                  break;
        case "05": $monthLabel = "May";
                  break;
        case "06": $monthLabel = "Jun";
                  break;
        case "07": $monthLabel = "Jul";
                  break;
        case "08": $monthLabel = "Aug";
                  break;
        case "09": $monthLabel = "Sept";
                  break;
        case "10": $monthLabel = "Oct";
                  break;
        case "11": $monthLabel = "Nov";
                  break;
        case "12": $monthLabel = "Dec";
                  break;
      }
        return $monthLabel;
    }
    function convertTime($hr,$min,$sec){
      switch($hr){
        case "01" : $time = "01:". $min .":". $sec ." AM";
                  break;
        case "02" : $time = "02:". $min .":". $sec ." AM";
                  break;
        case "03" : $time = "03:". $min .":". $sec ." AM";
                  break;
        case "04" : $time = "04:". $min .":". $sec ." AM";
                  break;
        case "05" : $time = "05:". $min .":". $sec ." AM";
                  break;
        case "06" : $time = "06:". $min .":". $sec ." AM";
                  break;
        case "07" : $time = "07:". $min .":". $sec ." AM";
                  break;
        case "08" : $time = "08:". $min .":". $sec ." AM";
                  break;
        case "09" : $time = "09:". $min .":". $sec ." AM";
                  break;
        case "10" : $time = "10:". $min .":". $sec ." AM";
                  break;
        case "11" : $time = "11:". $min .":". $sec ." AM";
                  break;
        case "12" : $time = "12:". $min .":". $sec ." PM";
                  break;
        case "13" : $time = "01:". $min .":". $sec ." PM";
                  break;
        case "14" : $time = "02:". $min .":". $sec ." PM";
                  break;
        case "15" : $time = "03:". $min .":". $sec ." PM";
                  break;
        case "16" : $time = "04:". $min .":". $sec ." PM";
                  break;
        case "17" : $time = "05:". $min .":". $sec ." PM";
                  break;
        case "18" : $time = "06:". $min .":". $sec ." PM";
                  break;
        case "19" : $time = "07:". $min .":". $sec ." PM";
                  break;
        case "20" : $time = "08:". $min .":". $sec ." PM";
                  break;
        case "21" : $time = "09:". $min .":". $sec ." PM";
                  break;
        case "22" : $time = "10:". $min .":". $sec ." PM";
                  break;
        case "23" : $time = "11:". $min .":". $sec ." PM";
                  break;
        case "24" : $time = "12:". $min .":". $sec ." AM";
                  break;
      }
      return $time;
    }
    function checkLevel($co,$co2){
    	
    	if($co > 0 AND $co <= 100 AND $co2 > 0 AND $co2 <= 100){
    		$image = "images/Happy.jpg";
    	}
    	if($co > 100 AND $co <= 200 AND $co2 > 100 AND $co2 <= 200){
    		$image = "images/Neutral.jpg";
    	}
    	if($co > 200 AND $co <= 300	AND $co2 > 200 AND $co2 <= 300){
    		$image = "images/Mask.jpg";
    	}
    	return $image;
    }
    ?>