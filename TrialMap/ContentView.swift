import GoogleMapsUtils

class KML: NSObject {
  private var mapView: GMSMapView!

  func renderKml() {
    guard let path = Bundle.main.path(forResource: "KML_Sample", ofType: "kml") else {
      print("Invalid path")
      return
    }

    let url = URL(fileURLWithPath: path)

    let kmlParser = GMUKMLParser(url: url)
    kmlParser.parse()

    let renderer = GMUGeometryRenderer(
      map: mapView,
      geometries: kmlParser.placemarks,
      styles: kmlParser.styles
    )

    renderer.render()
  }
}
      
