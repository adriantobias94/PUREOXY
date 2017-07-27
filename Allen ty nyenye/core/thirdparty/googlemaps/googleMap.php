<style>
   #map {
    height: 400px;
    width: 100%;
   }
</style>
<h3>My Google Maps Demo</h3>
<div id="map"></div>
<script>
  function initMap() {
    var uluru = {lat: 12.8797, lng: 121.7740};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      center: uluru
    });
    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
  
  
</script>
<script async defer
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDVGor8oFweRnW-Xi3uxESgalbhuT4tM3o&callback=initMap">
</script>
