<!DOCTYPE html>
<html>
    <head>
        <title>Title of the document</title>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </head>
 
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
    

      $strQuery = "SELECT date, co2 FROM air_data wHERE module_id='".$id. "'";

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

      $strQuery2 = "SELECT date, co FROM air_data wHERE module_id='".$id. "'";

      // Execute the query, or else return the error message.
      $result3 = $dbhandle->query($strQuery2) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
        
      $dataPoints2=[];
        while($row = mysqli_fetch_array($result3)) {
            array_push($dataPoints2, array(
                "y" => $row["co"],
                "label" => $row["date"]
                )
            );
          }
      }
    ?>
 <body>
  <div class="container">
      <div class="row">
        <div class="col-md-6" style ="">
        <div id="chartContainer" style="height: 250px; width: 100%;"></div>
 
        <script type="text/javascript">

         var content_textc02 = "CO2 Level of " + "<?php echo $name ?>"
            $(function () {
                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "theme2",
                    animationEnabled: true,
                    title: {
                        text: content_textc02
                    },
                    data: [
                    {
                        type: "column",                
                        dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
                    }
                    ]
                });
                chart.render();
            });
        </script>
        </div>
        <div class="col-md-12"></div>
      
        <div class="col-md-6" style="">
        <div id="chartContainer2" style="height: 250px; width: 100%;"></div>

         <script type="text/javascript">
          
          var content_textc0 = "CO Level of " + "<?php echo $name ?>"

            $(function () {
                var chart = new CanvasJS.Chart("chartContainer2", {
                    theme: "theme2",
                    animationEnabled: true,
                    title: {
                        text: content_textc0
                    },
                    data: [
                    {
                        type: "column",                
                        dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
                    }
                    ]
                });
                chart.render();
            });
        </script>
        </div>
        <div id="col-md-2"></div>
        <div id="col-md-4"></div>
        </div>
        </div>
    </body>
 
</html>
 