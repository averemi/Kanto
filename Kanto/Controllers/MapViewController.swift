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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomInitialLocation()
    }
}

/// MARK: Mapkit Delegate Methods

extension MapViewController: MKMapViewDelegate {
    func zoomInitialLocation() {
        let location = CLLocationCoordinate2D(latitude: 48.896437, longitude: 2.318578)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        mapView.setRegion(region, animated: true)
    }
}

