//
//  ViewController.swift
//  pixel-city
//
//  Created by Oforkanji Odekpe on 5/22/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
    }
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
    }
}

extension MapVC: MKMapViewDelegate{
    
}

