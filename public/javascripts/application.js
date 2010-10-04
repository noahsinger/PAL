// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function init_map( ) {
    var latlng = new google.maps.LatLng(36.1566, -95.8742);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

    google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(map, event.latLng);
    });
}

function placeMarker(map, location) {
  var clickedLocation = new google.maps.LatLng(location);
  var lat = location.lat( );
  var lng = location.lng( );

  $("#location_lat").val( location.lat( ) );
  $("#location_lng").val( location.lng( ) );

  var marker = new google.maps.Marker({
      position: location,
      map: map
  });

  map.setCenter(location);
}

$(document).ready( function( ) {
    // reveal the notice p
    setTimeout( function( ) {$("#notice").slideDown("slow")}, 1000 );
		setTimeout( function( ) {$("#alert").slideDown("slow")}, 1000 );

    //if map on page, init
    if( $("#map_canvas").size( ) > 0 ) {
        init_map( );
    }
});
