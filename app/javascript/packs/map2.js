mapboxgl.accessToken =
  "pk.eyJ1IjoiZHJvcGtpY2sxOSIsImEiOiJjazJlemNmNzgwZjBzM2JxcG5hYXI2cjI5In0.kwVm56BJ6qfO7J_28qsxAg";
var map = new mapboxgl.Map({
  container: "map", // container id
  style: "mapbox://styles/mapbox/streets-v11", // stylesheet location
  center: [-99.168, 19.408], // starting position [lng, lat]
  zoom: 15
  // starting zoom
});
