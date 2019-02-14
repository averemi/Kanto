//
//  PlacesListViewController.swift
//  Kanto
//
//  Created by Anastasia Veremiichyk on 2/12/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class PlacesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var places: [String] = ["Ohio", "New Orleans", "Chernivtsi", "Kyiv", "42"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


/// MARK: Tableview Delegate Methods
extension PlacesListViewController: UITableViewDelegate {
    
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
