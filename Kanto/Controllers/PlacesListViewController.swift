//
//  PlacesListViewController.swift
//  Kanto
//
//  Created by Anastasia Veremiichyk on 2/12/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit
import CoreLocation

class PlacesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


/// MARK: Tableview Delegate Methods
extension PlacesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.tabBarController?.viewControllers![0] as! MapViewController
        vc.showSelectedLocation(location: places[indexPath.row].coordinate)
        self.tabBarController!.selectedIndex = 0
        
    }
}


/// MARK: Tableview Datasource Methods
extension PlacesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell") as! PlaceTableViewCell
        cell.configure(place: places[indexPath.row])
        return cell
    }
    
    
}
