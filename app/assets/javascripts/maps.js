function initMap() {
  $(document).on('turbolinks:load', function() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 13,
      center: new google.maps.LatLng(25.7617, -80.1918),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    function markerContent(permit) {
      return "<ul>"
      + "<li>" + "<b>"+ "Permit Number: " + "</b>" + permit.permit_number  + "</li>"
      + "<li>" + "<b>"+ "Adress: " + "</b>" +  permit.address + "</b>" + "</li>"
      + "<li>" + "<b>"+ "Scope of Work: " + "</b>" +  permit.scope_of_work + "</b>" + "</li>"
      + "<li>" + "<b>"+ "Total Cost: " + "</b>" +  permit.total_cost + "</b>" + "</li>"
      + "</ul>"
    }

    var infowindow = new google.maps.InfoWindow();
    var marker, i, permit, markers = [];
    for (i = 0; i < gon.permits.length; i++) {
      permit = gon.permits[i];
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(permit.lat, permit.long),
        map: map
      });
      markers.push(marker);

      // Immediately Invoking Function Expression (IIFE)
      (function(marker, permit) {
        marker.addListener('click', function() {
          infowindow.setContent(markerContent(permit));
          infowindow.open(map, marker);
        })
      })(marker, permit);
    }

    var markerCluster = new MarkerClusterer(map, markers,
      {imagePath: '/clusters/clusters'});


  });
}
