<!DOCTYPE html>
<html>
  <head>
    <style>
    
       #map {
        height: 600px;
        width: 100%;
       }
    </style>
    <title>Bootstrap Example</title>
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
        <div class ="col-sm-6"><span class="pull-right">
           <div id="map" style="width:650px; height:530px; margin-top: 80px; margin-right: 1px; border: 2px solid; border-color: "></div></span>
           </div> 

        <div class ="col-sm-6">
            <div id="info" style="margin-top: 100px;"></div>

              <div id="analytics" style="margin-top: 50px;"></div>
        </div>        
        
      </div>
  
      <script type="text/javascript">
      var infoWindow = new google.maps.InfoWindow(); 
        function initMap() {
            //map options
          var uluru = {lat:14.5995, lng: 120.9842};
          var hehe = {lat:14.5547, lng: 121.0244};
          var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 11,
            center: uluru
              
          });
      <?php
                  $hostdb = "localhost";  // MySQl host
                  $userdb = "root";  // MySQL username
                  $passdb = "";  // MySQL password
                  $namedb = "pureoxy";  // MySQL database name
                  $dbhandle = new mysqli($hostdb, $userdb, $passdb, $namedb);
                    $strQuery = "SELECT latitude, longitude FROM module";
                      // Execute the query, or else return the error message.
                  $result = $dbhandle->query($strQuery) or exit("Error code ({$dbhandle->errno}): {$dbhandle->error}");
        
                  while($row = mysqli_fetch_array($result)) {

                    ?> addMarker({lat:<?php echo $row["latitude"]?>, lng:<?php echo $row["longitude"]?>});

                        
            
                      



          <?php
                }
            ?>                   
          //add Marker function
          function addMarker(lat,lng){

              
                        var infoWindow = new google.maps.InfoWindow({
                        content: 'Makati'
                    });

         var marker = new google.maps.Marker({
                       position: lat,lng,
                        map: map
                });

         google.maps.event.addListener(marker,'mouseover',function(){
      
              infoWindow.open(map,marker);
              var latitude = marker.getPosition().lat();
              var longitude = marker.getPosition().lng();
              $("#analytics").load('sample.php?lat=' + latitude + '&lng=' + longitude);
            
          
          });

         google.maps.event.addListener(marker,'click',function(){

          var latitude = marker.getPosition().lat();
          var longitude = marker.getPosition().lng();
          window.open("history.php?lat=" + latitude + "&lng=" + longitude);
         });
         google.maps.event.addListener(marker,'mouseout', function(){
            
            infoWindow.close();
            $("#analytics").load('pick.html');
         });
        }
  } 
          </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBG-tC1rtLmm_O3A3Nw_ifto3QF0kYBdZw&callback=initMap">
    </script>
  </body>
      

</html>