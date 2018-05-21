//
//  locationLogin.swift
//  Myuzic
//
//  Created by Arya Mirshafii on 5/19/18.
//  Copyright © 2018 aryaMirshafii. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer
import CoreLocation

class locationLogin: UIViewController, CLLocationManagerDelegate{
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        
    }
    
    @IBAction func dismissMe(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}

