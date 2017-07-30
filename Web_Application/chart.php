<!DOCTYPE HTML>
<html>

<head>  
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>
<?php
if(isset($_GET['lat'])){

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
      $name = "" .$key['location']. " At " .$key['city']. " :";
      
      $checkLatest = "SELECT co, co2 FROM air_data WHERE module_id='".$id."' ORDER BY id DESC LIMIT 1";  

      $result4 = $dbhandle->query($checkLatest) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
    
      $levels = mysqli_fetch_array($result4);
   
      $co = $levels['co'];
      $co2 = $levels['co2'];

      $strQuery = "SELECT date, co2 FROM air_data WHERE module_id='".$id."' AND date='2017-07-13' ORDER BY id DESC LIMIT 5";

      // Execute the query, or else return the error message.
      $result = $dbhandle->query($strQuery) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
        
      $dataPoints=[];
        while($row = mysqli_fetch_array($result)) {
            array_push($dataPoints, array(
                "y" => $row["co2"],
                "label" => $row["date"]
                )
            );
          }

      $strQuery2 = "SELECT date, co FROM air_data wHERE module_id='".$id. "' AND date='2017-07-13' ORDER BY id DESC LIMIT 5";

      // Execute the query, or else return the error
      $result3 = $dbhandle->query($strQuery2) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
        
      $dataPoints2=[];
        while($row = mysqli_fetch_array($result3)) {
            array_push($dataPoints2, array(
                "y" => $row["co"],
                "label" => $row["date"],
                
                )
            );
          }

      }

      
    ?>
 <script type="text/javascript">
  $(function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {      
      title:{
        text: "CO and CO2 Levels"
      },
      animationEnabled: true,
      axisY :{
        includeZero: false,
        maximum: 200
      },
      toolTip: {
        shared: "true"
      },
      data: [
      {        
        type: "spline", 
        showInLegend: true,
        name: "CO Level",
        markerSize: 0,        
        dataPoints:  <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
      },
      {        
        type: "spline", 
        showInLegend: true,
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
</body>
</html>