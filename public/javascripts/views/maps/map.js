var initMap = function (options) {
  var map = new YMaps.Map(YMaps.jQuery("#map")[0]);
  map.setCenter(new YMaps.GeoPoint(options.lng, options.lat), options.zoom);
}
