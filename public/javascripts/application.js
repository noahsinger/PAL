// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//marker for the map
var markers = [];

function editable_map( ) {
    var latlng = new google.maps.LatLng(36.1566, -95.8742);
    var myOptions = {
      zoom: 8,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_for_editing"), myOptions);

    google.maps.event.addListener(map, 'click', function(event) {
        clear_markers( );
        placeMarker(map, event.latLng);
    });
}

function showable_map( ) {
    var lat = $("#lat").val( );
    var lng = $("#lng").val( );
    var latlng = new google.maps.LatLng(lat,lng); 

    var myOptions = {
      zoom: 15,
      center: latlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    var map = new google.maps.Map(document.getElementById("map_for_showing"), myOptions);

    placeMarker( map, latlng );

    if( navigator.geolocation ) {
        navigator.geolocation.getCurrentPosition( function( position ) {
          show_current_location( map, position, latlng ); 
        });
    }
}

function show_current_location( map, position, destination ) {

    var lat = position.coords.latitude;
    var lng = position.coords.longitude;

    var origin = new google.maps.LatLng(lat,lng)

    placeMarker( map, origin );

    var directionsRenderer = new google.maps.DirectionsRenderer({draggable: true});
    directionsRenderer.setMap(map);
    directionsRenderer.setPanel(document.getElementById('directions_panel'));

    var directionsService = new google.maps.DirectionsService();
    var request = {
      origin: origin,
      destination: destination,
      travelMode: google.maps.DirectionsTravelMode.DRIVING
    };

    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsRenderer.setDirections(response);
        clear_markers( );
      } else {
        $("#notice").html( "We were unable to retreive directions for you.  Sorry :(" );
        $("#notice").show( "slow" );
      }
    });
}

function placeMarker(map, location) {
  var clickedLocation = new google.maps.LatLng(location);
  var lat = location.lat( );
  var lng = location.lng( );

  $("#location_lat").val( location.lat( ) );
  $("#location_lng").val( location.lng( ) );

  markers.push( new google.maps.Marker({
      position: location,
      map: map
  }) );
}

function clear_markers( ) {
    if( markers.length != 0 ) {
        for( var x = 0 ; x < markers.length ; x++ ) {
            markers[x].setMap( null );
        }
    }
    return false;
}

$(document).ready( function( ) {
    // reveal the notice p
    $("#notice").show("slow");

    // setup location map for showing
    if( $("#map_for_showing").size( ) > 0 ) {
        showable_map( );
    }

    // setup location map for editing
    if( $("#meeting_location").size( ) > 0 ) {
        $("#meeting_location").change( function ( ) {
           if( $(this).val( ) == "new" ) {
               $("#create_location").show();
               editable_map( );
           } else {
                $("#create_location").hide();
           }
        });
    }

    //setup album lightbox
    $("#album a").has("img").lightBox({fixedNavigation:true,
                            imageBlank: '../../../../images/lightbox-blank.gif',
                            imageLoading: '../../../../images/lightbox-ico-loading.gif',
	                        imageBtnClose: '../../../../images/lightbox-btn-close.gif',
	                        imageBtnPrev: '../../../../images/lightbox-btn-prev.gif',
	                        imageBtnNext: '../../../../images/lightbox-btn-next.gif'});
});