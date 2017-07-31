<?php
if(isset($_GET['lat'])){
include 'function.php';
  $latitude = $_GET['lat'];
  $longitude = $_GET['lng'];

   $hostdb = "localhost";  // MySQl host
   $userdb = "root";  // MySQL username
   $passdb = "";  // MySQL password
   $namedb = "pureoxy";  // MySQL database name

      $dbhandle = new mysqli($hostdb, $userdb, $passdb, $namedb);
      
      $strSearch = "SELECT id, city, location FROM module WHERE latitude='" .$latitude. "' AND longitude='".$longitude."'";
      $result2 = $dbhandle->query($strSearch) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");

      $key = mysqli_fetch_array($result2);
      $id = $key['id'];
      $name = "" .$key['location']. " in " .$key['city']. "";
      
      $checkLatest = "SELECT co, co2 FROM air_data WHERE module_id='".$id."' AND date='2017-07-17' ORDER BY time DESC LIMIT 1";  

      $result4 = $dbhandle->query($checkLatest) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
    
      $levels = mysqli_fetch_array($result4);
   
      $co = $levels['co'];
      $co2 = $levels['co2'];

      $strQuery = "SELECT time, date, co2 FROM air_data WHERE module_id='".$id."' AND date='2017-07-17' ORDER BY time DESC LIMIT 5";

      // Execute the query, or else return the error message.
      $result = $dbhandle->query($strQuery) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
        
      $dataPoints=[];
        while($row = mysqli_fetch_array($result)) {
          $label = $row['co2'];
          $time = $row['time'];
          $array = explode(':', $time);
          $hr = $array[0];
          $min = $array[1];
          $sec = $array[2];
          $time = convertTime($hr,$min,$sec);
            array_push($dataPoints, array(
                "y" => $row["co2"],
                "label" => $time,
                "indexLabel" =>" ".$label." "
                
                )
            );
          }

      $strQuery2 = "SELECT time, date, co FROM air_data wHERE module_id='".$id. "' AND date='2017-07-17' ORDER BY time DESC LIMIT 5";

      // Execute the query, or else return the error
      $result3 = $dbhandle->query($strQuery2) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
        
      $dataPoints2=[];
        while($row = mysqli_fetch_array($result3)) {
          $label = $row['co'];
          $date = $row["date"];
          $array = explode('-', $date);
          $month = $array[1];
          $month = monthFind($month);
          $time = $row['time'];
          $array2 = explode(':', $time);
          $hr = $array2[0];
          $min = $array2[1];
          $sec = $array2[2];
          $time = convertTime($hr,$min,$sec);
          $dateLabel = "".$month. " ".$array[2]. ", " .$array[0]."";
            array_push($dataPoints2, array(
                "y" => $row["co"],
                "label" => $time,
                "indexLabel" =>" ".$label." "
                
                )
            );
          }

      }
    
?>
    <!DOCTYPE HTML>
   
<html>

<head>  
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>

 <script type="text/javascript">
  $(function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {      
      title:{
        text: "CO and CO2 Levels at " + "<?php echo $name?>"  + " - " + "<?php echo $dateLabel ?>"
      },
      animationEnabled: true,
      axisY :{
        includeZero: false,
        title: "Levels",
        maximum: 300
      },
      toolTip: {
        shared: "true"
      },
      legend: {
          fontSize: 16
      },
      axisX:{
            title: "Time",
              reversed: true //Try Changing to false
            },
      data: [
      {        
        type: "spline",
        showInLegend: true,
        indexLabelFontSize: 15,
        indexLabelFontColor: "black",
        indexLabelFontWeight: "bold",
        name: "CO Level",
        markerSize: 0,        
        dataPoints:  <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
      },
      {        
        type: "spline", 
        showInLegend: true,
        indexLabelFontSize: 15, 
        indexLabelFontColor: "black",
        indexLabelFontWeight: "bold",
        name: "CO2 Level",
        markerSize: 0,        
        dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
      }      
      ]
    });

chart.render();
});
</script>

  <div id="chartContainer" style="height: 300px; width: 100%;">
  </div>
  <br />
  <div class="container">
    <div class="row">
        <div class ="col-sm-4">
  <h3>Current CO Level: <?php echo $co ?></h3>
  <h3>Current CO2 Level: <?php echo $co2 ?></h3></div>

  <div class ="col-sm-3"><span class="pull-right">
   <img src="<?php print_r(checkLevel($co,$co2)) ?>" style="height: 160px; width: 100%; padding-left: 1px;" />
   </div></span>
   <div class ="col-sm-5"></div>
   </div>
   </div>

</div>
</body>
</html>