 <?php
   if($_GET['lat']){
          $latitude = $_GET['lat'];
          $longitude = $_GET['lng'];
          
   $hostdb = "localhost";  // MySQl host
   $userdb = "root";  // MySQL username
   $passdb = "";  // MySQL password
   $namedb = "pureoxy";  // MySQL database name

    $dbhandle = new mysqli($hostdb, $userdb, $passdb, $namedb);

      $strSearch = "SELECT id, location, city FROM module WHERE latitude='" .$latitude. "' AND longitude='".$longitude."'";
      $result2 = $dbhandle->query($strSearch) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");

      $key = mysqli_fetch_array($result2);
      $id = $key['id'];
      $name = "" .$key['location']. " At " .$key['city']. " :";



      $strQuery = "SELECT date, co2 FROM air_data wHERE module_id='".$id."'";
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
      $strQuery2 = "SELECT date, co FROM air_data WHERE module_id='".$id."'";
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
<!DOCTYPE html>
<html>
    <head>
        <title><?php echo $key['location']; ?></title>
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
 
   
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Pure Oxy</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="about.html">About</a>
                    </li>
                    <li>
                        <a href="services.php">Services</a>
                    </li>
                    <li>
                      <a href="#">Contact</a>
                    </li>
                    <li>
                        <a href="register2.php">Register</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <div class="container">
      <div class="row">
        <div class="col-md-6" style ="padding-top: 100px;">
        <div id="chartContainer" style=""></div>
        <script type="text/javascript">

        var content_textc02 = "Historical Data of CO2 " + "<?php echo $name ?>"
 
            $(function () {
                var chart = new CanvasJS.Chart("chartContainer", {
                    theme: "theme2",
                    zoomEnabled: true,
                    animationEnabled: true,
                    title: {
                        text: content_textc02
                    },
                    subtitles:[
                        {   text: "" }
                    ],
                    data: [
                    {
                        type: "spline",                
                        dataPoints: <?php echo json_encode($dataPoints, JSON_NUMERIC_CHECK); ?>
                    }
                    ]
                });
                chart.render();
            });
        </script>
        </div>
        <div class="col-md-6" style="padding-top: 100px;">
        <div id="chartContainer2" style=""></div>
        <script type="text/javascript">

        var content_text = "Historical Data of CO " + "<?php echo $name ?>"
 
            $(function () {
                var chart = new CanvasJS.Chart("chartContainer2", {
                    theme: "theme2",
                    zoomEnabled: true,
                    animationEnabled: true,
                    title: {
                        text: content_text
                    },
                    subtitles:[
                        {   text: "" }
                    ],
                    data: [
                    {
                        type: "spline",                
                        dataPoints: <?php echo json_encode($dataPoints2, JSON_NUMERIC_CHECK); ?>
                    }
                    ]
                });
                chart.render();
            });
        </script>
        </div>
        </div>
        </div>
    </body>
 
</html>
 