$(document).ready(function() {


mapboxgl.accessToken = 'pk.eyJ1Ijoic3NzbmFja3MiLCJhIjoiY2ptanQxMHZ6MDI0dzNrbGNlODg4NXprYiJ9.8Fl_Mzmv_jSApsyVW_lyfg';
var monument = [-112.942500, 37.268600];
var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/sssnacks/cjn24qmxk6hax2rn62sjbysj7',
  center: monument,
  zoom: 13.0
});


// create the popup
var popup = new mapboxgl.Popup({ offset: 25 })
    .setText('Construction on the Washington Monument began in 1848.');

// create DOM element for the marker
var el = document.createElement('div');
el.id = 'marker';

// create the marker
new mapboxgl.Marker(el)
    .setLngLat(monument)
    .setPopup(popup) // sets a popup on this marker
    .addTo(map);


//zoom in double click, zoom out shift double click
map.addControl(new mapboxgl.NavigationControl());
map.scrollZoom.disable();

// Add geolocate control to the map.
map.addControl(new mapboxgl.GeolocateControl({
    positionOptions: {
        enableHighAccuracy: true
    },
    trackUserLocation: true
}));
 

});




(function($) {
window.fnames = new Array();
window.ftypes = new Array();
fnames[0]='EMAIL';
ftypes[0]='email';
fnames[1]='FNAME';
ftypes[1]='text';
fnames[2]='LNAME';
ftypes[2]='text';
fnames[3]='ADDRESS';
ftypes[3]='address';
fnames[4]='PHONE';
ftypes[4]='phone';
fnames[5]='BIRTHDAY';
ftypes[5]='birthday';}
(jQuery));
var $mcj = jQuery.noConflict(true);

});
