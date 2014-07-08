function initializeMap(markers, center){
  var handler = Gmaps.build('Google');
  var location;
  var markers = markers;
  mapGenerator(markers, center);
  console.log(center)
  $('#restaurants').show(2000);

  function mapGenerator(markers, center){
    handler.buildMap({provider: {
      zoom: 13,
      center: new google.maps.LatLng(center[0], center[1]),
      styles: styles
    }, internal: {id: 'map'}}, function(){
      handler.addMarkers(markers);
    });
  }
}



var styles = [
{
  "featureType": "landscape",
  "stylers": [
  {
    "lightness": 16
  },
  {
    "hue": "#ff001a"
  },
  {
    "saturation": -61
  }
  ]
},
{
  "featureType": "road.highway",
  "stylers": [
  {
    "hue": "#ff0011"
  },
  {
    "lightness": 53
  }
  ]
},
{
  "featureType": "poi.park",
  "stylers": [
  {
    "hue": "#00ff91"
  }
  ]
},
{
  "elementType": "labels",
  "stylers": [
  {
    "lightness": 63
  },
  {
    "hue": "#ff0000"
  }
  ]
},
{
  "featureType": "water",
  "stylers": [
  {
    "hue": "#0055ff"
  }
  ]
},
{
  "featureType": "road",
  "elementType": "labels",
  "stylers": [
  {
    "visibility": "off"
  }
  ]
}
]

// initializeMap();