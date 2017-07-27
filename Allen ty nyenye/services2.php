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
   <?php 

    $markers = array();         
    $sql_locations1="SELECT DISTINCT id,latitude,longitude from `module` DESC limit 1";
    $result1 = mysqli_query($conn,$sql_locations1);
    while($row=mysqli_fetch_assoc($result1))
        {                   
           $markers[] = array(
            'abc',
              $row['latitude'],
            $row['longitude'],          
            );      
        }?>

<div id="map_canvas" onload="initMap()"></div>
      <script>
function initialize() {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: "roadmap",
        center: new google.maps.LatLng(20.5937, 78.9629), // somewhere in the uk BEWARE center is required
        zoom: 1,
    };
    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);
    // Multiple Markers
    var markers = <?php echo json_encode( $markers );?>;
     // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow();
    var marker, i;
    // Loop through our array of markers & place each one on the map
    for (i = 0; i < markers.length; i++) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });
        // Allow each marker to have an info window
        google.maps.event.addListener(marker, 'click',  (function (marker, i) {
            return function () {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }
    //Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function (event) {
        this.setZoom(5);
        google.maps.event.removeListener(boundsListener);
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
          </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBG-tC1rtLmm_O3A3Nw_ifto3QF0kYBdZw&callback=initMap">
    </script>
  </body>
      

</html>