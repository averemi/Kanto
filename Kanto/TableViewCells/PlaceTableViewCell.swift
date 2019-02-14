//
//  PlaceTableViewCell.swift
//  Kanto
//
//  Created by Anastasia Veremiichyk on 2/12/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(place: String) {
        placeLabel.text = place
    }

}
