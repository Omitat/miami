

function initMap() {




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
      + "<li>" + "<b>"+ "Permit Number: " + "</b>" +  permit.total_cost + "</b>" + "</li>"
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
    {imagePath: '/assets/clusters/clusters'});



}

function initAutocomplete() {




     var map = new google.maps.Map(document.getElementById('map'), {
       center: {lat: 25.7617, lng: -80.1918 },
       zoom: 13,
       mapTypeId: 'roadmap'
     });


// Create the search box and link it to the UI element.
var input = document.getElementById('pac-input');
var searchBox = new google.maps.places.SearchBox(input);
map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

// Bias the SearchBox results towards current map's viewport.
map.addListener('bounds_changed', function() {
  searchBox.setBounds(map.getBounds());
});

var markers = [];
// Listen for the event fired when the user selects a prediction and retrieve
// more details for that place.
searchBox.addListener('places_changed', function() {
  var places = searchBox.getPlaces();

  if (places.length == 0) {
    return;
  }

  // Clear out the old markers.
  markers.forEach(function(marker) {
    marker.setMap(null);
  });
  markers = [];

  // For each place, get the icon, name and location.
  var bounds = new google.maps.LatLngBounds();
  places.forEach(function(place) {
    if (!place.geometry) {
      console.log("Returned place contains no geometry");
      return;
    }
    var icon = {
      url: place.icon,
      size: new google.maps.Size(71, 71),
      origin: new google.maps.Point(0, 0),
      anchor: new google.maps.Point(17, 34),
      scaledSize: new google.maps.Size(25, 25)
    };
    // Create a marker for each place.
                markers.push(new google.maps.Marker({
                  map: map,
                  icon: icon,
                  title: place.name,
                  position: place.geometry.location
                }));

                if (place.geometry.viewport) {
                  // Only geocodes have viewport.
                  bounds.union(place.geometry.viewport);
                } else {
                  bounds.extend(place.geometry.location);
                }
              });
              map.fitBounds(bounds);
            });

  initMap()


          }
