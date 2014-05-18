function initializeMap(){
  var handler = Gmaps.build('Google');
  var location;
  var markers = [];
  setTimeout(mapGenerator,4000);

  navigator.geolocation.getCurrentPosition(function(result){
    location = result.coords
  });

  function mapGenerator(){
    handler.buildMap({provider: {
      zoom: 13,
      center: new google.maps.LatLng(location.latitude, location.longitude),
      styles: styles
    }, internal: {id: 'map'}}, function(){
      makeMarker();
      handler.addMarkers(markers)
    });
  }

  function makeMarker(latitude,longitude){
    markers.push({"lat": latitude || location.latitude,
      "lng": longitude || location.longitude,
      "picture": {
        "url": "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        "width":  36,
        "height": 36
      },
      "infowindow": "You're here!"
      });
    console.log(markers)
  };
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