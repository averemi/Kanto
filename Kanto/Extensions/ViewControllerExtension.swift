//
//  ViewControllerExtension.swift
//  Kanto
//
//  Created by Anastasia Veremiichyk on 2/16/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentErrorMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
