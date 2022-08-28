//
//  MapViewController.swift
//  Office Tracker
//
//  Created by Mac on 23.08.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    

    @IBOutlet weak var mapView: MKMapView!
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    mapView.delegate = self
    
    mapView.addAnnotation(Annotation(coordinate: .init(latitude: 41.08107400020662, longitude: 29.009788711694544), title: "Kollektif House Levent"))
    
    mapView.addAnnotation(Annotation(coordinate: .init(latitude: 41.114104, longitude: 29.022484), title: "Kollektif House Maslak"))

  //  OfficeListScreen().offices.forEach { officeLocation in
      //  mapView.addAnnotation(Annotation(coordinate: .init(latitude: officeLocation.location?.latitude ?? 0.0, longitude: officeLocation.location?.longitude ?? 0.0), title: officeLocation.name))
   

    // Do any additional setup after loading the view.
}


}


extension MapViewController: MKMapViewDelegate{
func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
    print("mapViewWillStartLoadingMap")
}

func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
    print("mapViewDidFinishLoadingMap")
}

func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    let annotation = view.annotation as? Annotation
    print("didSelect", annotation?.title ?? "")
}

func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
    print("didDeselect")
}
}

class Annotation: NSObject, MKAnnotation {
var coordinate: CLLocationCoordinate2D
var title: String?

init(coordinate: CLLocationCoordinate2D, title: String?){
    self.coordinate = coordinate
    self.title = title
}
}


    

