//
//  AlertService.swift
//  involtaTest
//
//  Created by Роман Ковайкин on 12.03.2021.
//

import Foundation
import UIKit

class AlertService{
    
    static func showAlert(vc: UIViewController){
        let alert = UIAlertController(title: "Error", message: "You are not connected to the Internet", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        vc.present(alert, animated: true, completion: nil)
    }
    
}
