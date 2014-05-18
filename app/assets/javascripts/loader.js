function loader(){
  var mapDiv = $('#map');
  var text = 'Map is loading';
  var loaderText = $('<p id="loader">').text(text);

  var loader = setInterval(function(){
    mapDiv.append(loaderText.text(text).fadeIn(250));
    text += ' . '
  }, 750);
  setTimeout(function(){
    clearInterval(loader);
  },4000)  
}

loader();
initializeMap();