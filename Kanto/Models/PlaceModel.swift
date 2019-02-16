//
//  PlaceModel.swift
//  Kanto
//
//  Created by Anastasia Veremiichyk on 2/16/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Place: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    var title: String?
    var subtitle: String?
    let longitude: Double
    let latitude: Double
    let color: UIColor
    
    init(name: String, descript: String, longitude: Double, latitude: Double, color: UIColor) {
        self.title = name
        self.subtitle = descript
        self.longitude = longitude
        self.latitude = latitude
        self.coordinate = CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
        self.color = color
    }
}

var places : [Place] = [
    Place(name: "42", descript: "School 42", longitude: 2.318578, latitude: 48.896437,
        color: .red),
    Place(name: "Unit Factory", descript: "Ukrainian National IT Factory", longitude: 30.462213, latitude: 50.468956,
        color: .green),
    Place(name: "Hamburg", descript: "Where my bestie lives", longitude: 9.961903, latitude: 53.560691,
        color: .blue),
    Place(name: "Torno", descript: "Best Place on Earth", longitude: 9.1166, latitude: 45.8561,
        color: .yellow)
]
