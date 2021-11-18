//
//  MapViewController.swift
//  UToilet
//
//  Created by William Connell on 11/17/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let gatesDellCoordinates = CLLocationCoordinate2D(latitude: 30.286236, longitude: -97.736515)
    let pclCoordinates = CLLocationCoordinate2D(latitude: 30.282677, longitude: -97.738121)

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.setRegion(MKCoordinateRegion(center: gatesDellCoordinates, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: false)
        
        mapView.delegate = self
        addPins()
    }
    
    
    // Add all pins to the map
    // In order to scale, this function could iterate through database values, fetching the title and coordinates of each building
    private func addPins() {
        let pinOne = MKPointAnnotation()
        pinOne.coordinate = gatesDellCoordinates
        pinOne.title = "Gates Dell Complex"
        pinOne.subtitle = "Click to Explore Toilets"
        
        let pinTwo = MKPointAnnotation()
        pinTwo.coordinate = pclCoordinates
        pinTwo.title = "Perry Castañedas Library"
        pinTwo.subtitle = "Click to Explore Toilets"
        
        mapView.addAnnotation(pinOne)
        mapView.addAnnotation(pinTwo)
    }
    
    
    // Set up mapView with annotations
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            // Create the view
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            annotationView?.canShowCallout = true
            let rightButton = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = rightButton
        } else {
            annotationView?.annotation = annotation
        }
        
        annotationView?.image = UIImage(named: "toilet")
        
        return annotationView
    }
    
    
    // triggered when i info button pressed
    func mapView(_ mapView: MKMapView,
           annotationView view: MKAnnotationView,
                          calloutAccessoryControlTapped control: UIControl) {
        print("more info pressed")
    }


}
