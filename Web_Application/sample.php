<!DOCTYPE html>
<html>
    <head>
        <title>Title of the document</title>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </head>
 
    <?php


   $hostdb = "localhost";  // MySQl host
   $userdb = "root";  // MySQL username
   $passdb = "";  // MySQL password
   $namedb = "pureoxy";  // MySQL database name

    $dbhandle = new mysqli($hostdb, $userdb, $passdb, $namedb);

      $strQuery = "SELECT date, co2 FROM air_data wHERE module_id='1'";

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
    ?>
 
    <body>
        <div id="chartContainer"></div>
 
        <script type="text/javascript">
 
            $(function () {
                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "theme2",
                    animationEnabled: true,
                    title: {
                        text: "Air Data From "
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
    </body>
 
</html>
 