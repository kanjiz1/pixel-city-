//
//  ViewController.swift
//  pixel-city
//
//  Created by Oforkanji Odekpe on 5/22/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    let authorizationStatus = CLLocationManager.authorizationStatus()
    let regionRadious: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        
    }
    @IBAction func centerMapBtnWasPressed(_ sender: Any) {
        if authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse{
            centerMapOnUserLocation()
        }
    }
}

extension MapVC: MKMapViewDelegate{
    func centerMapOnUserLocation(){
        guard let coordinate = locationManager.location?.coordinate else {return}
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate, regionRadious * 2.0, regionRadious * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

extension MapVC: CLLocationManagerDelegate{
    func configureLocationServices(){
        if authorizationStatus == .notDetermined{
            locationManager.requestAlwaysAuthorization()
        } else{
            return
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        centerMapOnUserLocation()
    }
}

