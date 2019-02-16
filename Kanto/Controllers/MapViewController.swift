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
        setUpPinView()
        showSelectedLocation(location: places[0].coordinate)
    }
    
    func setUpPinView() {
        mapView.showsUserLocation = true
        for place in places {
            mapView.addAnnotation(place)
        }
    }
    
    func showSelectedLocation(location: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        mapView.setRegion(region, animated: true)
    }
    
    /// MARK: Actions
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = .standard
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
        guard let annotation = annotation as? Place else { return nil }
        var annotationView: MKPinAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
            as? MKPinAnnotationView {
            dequeuedView.annotation = annotation
            annotationView = dequeuedView
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            annotationView.canShowCallout = true
            annotationView.calloutOffset = CGPoint(x: -5, y: 5)
            annotationView.pinTintColor = annotation.color
        }
        return annotationView
    }
    
}

/// MARK: Location Manager Delegate Methods

extension MapViewController: CLLocationManagerDelegate {
    @IBAction func locateUser(_ sender: UIButton) {
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted, .denied:
            presentErrorMessage(title: "Location Services Disabled", message: "Please enable Location Services in Settings")
            return
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
            self.showSelectedLocation(location: (locationManager.location?.coordinate)!)
            break
        }
    }
}
