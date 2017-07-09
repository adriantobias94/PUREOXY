<?php
    $dbhost="localhost";
    $dblogin="root";
    $dbpwd="";
    $dbname="pureoxy";

    $conn = new mysqli($dbhost, $dblogin,$dbpwd="",$dbname);

     if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
    } 
    
    $sql = "SELECT percentage count(*), co2, date FROM air_data WHERE module_id='10'";



?>  


<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['percentage', 'co2','date'],
               <?php  
                          while($row = mysqli_fetch_array($sql))  
                          {  
                               echo "['".$row["percentage"].'","'.$row["co2"].'","'.$row["date"]."'],";  
                          }  
                ?>  
        ]);

        var options = {
          title: 'Past Result',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 110%; height: 500px;"></div>
  </body>
</html>