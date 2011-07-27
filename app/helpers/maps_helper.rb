module MapsHelper
  # Test api key
  def api_map_source
    "http://api-maps.yandex.ru/1.1/index.xml?key=ANpUFEkBAAAAf7jmJwMAHGZHrcKNDsbEqEVjEUtCmufxQMwAAAAAAAAAAAAvVrubVT4btztbduoIgTLAeFILaQ=="
  end

  def map_options
    if resource
      { :lng => resource.lng, :lat => resource.lat, :zoom => resource.zoom }
    else
      # Default options for Donetsk city
      { :lng => 37.804478, :lat => 48.002037, :zoom => 12 }
    end
  end
end
