//
//  MapViewController.swift
//  Kanto
//
//  Created by Anastasia Veremiichyk on 2/12/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        setInitialLocation()
    }
    
    func setUp() {
        mapView.showsUserLocation = true
    }
    
    func setInitialLocation() {
        
        let locationRegion = centerLocation(latitude: 48.896437, longitude: 2.318578)
        makePin(pinLocation: locationRegion)
    }
    
    
@discardableResult func centerLocation(latitude: Double, longitude: Double) -> CLLocationCoordinate2D {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        mapView.setRegion(region, animated: true)
        return location
    }
    
    func makePin(pinLocation: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.coordinate = pinLocation
        pin.title = "42"
        pin.subtitle = "42 school"
        
        mapView.addAnnotation(pin)
        
        //   let anotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "customAnnotation")
        //    anotationView.
    }
    
    /// MARK: Actions
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }
}

/// MARK: Mapkit Delegate Methods

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if type(of: annotation) == MKUserLocation.self {
            return nil
        }
        var annotationView: MKPinAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
            as? MKPinAnnotationView {
            dequeuedView.annotation = annotation
            annotationView = dequeuedView
        } else {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView.canShowCallout = true
            annotationView.calloutOffset = CGPoint(x: -5, y: 5)
        }
        annotationView.pinTintColor = .green
        return annotationView
    }
    
}

/// MARK: Location Manager Delegate Methods

extension MapViewController: CLLocationManagerDelegate {
    
    
    @IBAction func locateUser(_ sender: UIButton) {
        let status  = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if status == .denied || status == .restricted {
            let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable Location Services in Settings", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            
            present(alert, animated: true, completion: nil)
            return
        }
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        self.centerLocation(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
    }
        
}
