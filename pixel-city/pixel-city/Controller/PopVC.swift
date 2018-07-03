//
//  PopVC.swift
//  pixel-city
//
//  Created by Oforkanji Odekpe on 5/31/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Alamofire
import MapKit
import CoreLocation

class PopVC: UIViewController , UIGestureRecognizerDelegate{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateUploadedLabel: UILabel!
    @IBOutlet weak var popImageView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    var passedImage: UIImage!
    var uploadDate = Date()
    var takenDate = String()
    var id: String!
    var longitude: Double!
    var latitude: Double!
    
    func initData(forImage image: UIImage){
        self.passedImage = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popImageView.image = passedImage
        addDoubleTap()
        retrieveURLS { (finished) in
            print("Picture Loaded")
        }
        dateUploadedLabel.text = "Date Posted: \(uploadDate.description)"
        makeMap()
    }
    
    func makeMap(){
        let location = CLLocationCoordinate2DMake(self.latitude, self.longitude)
        let span = MKCoordinateSpanMake(1.5, 1.5)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Taken here"
        mapView.addAnnotation(annotation)
    }
    
    func retrieveURLS(handler: @escaping(_ status: Bool) -> () ){
        Alamofire.request(flickrInfoURL(forApiKey: API_KEY, photoID: id)).responseJSON { (response) in
            print(response)
            handler(true)
            guard let json = response.result.value as? Dictionary<String, AnyObject> else{return}
            let photoInfo = json["photo"] as! Dictionary<String, AnyObject>
            
            let photoTitle = photoInfo["title"] as! Dictionary<String, AnyObject>
            guard let title = photoTitle["_content"] as? String else {return}
            print(title)
            self.titleLabel.text = title
            
            let photoDescription = photoInfo["description"] as! Dictionary<String, AnyObject>
            guard let description = photoDescription["_content"] as? String else {return}
            print(description)
            self.descriptionLabel.text = description
            
            let photoLocation = photoInfo["location"] as! Dictionary<String, AnyObject>
            guard let latitude = photoLocation["latitude"] as? String else {return}
            self.latitude = Double(latitude)!
            guard let longitude = photoLocation["longitude"] as? String else {return}
            self.longitude = Double(longitude)!
            
            let photoDates = photoInfo["dates"] as! Dictionary<String, AnyObject>
            print(photoDates)
            guard let taken = photoDates["taken"] as? String else {return}
            guard let posted = photoDates["posted"] as? String else {return}
            print(taken)
            print(posted)
            self.uploadDate = Date(timeIntervalSince1970: Double(posted)!)
            self.takenDate = taken
        }
    }
    
    func addDoubleTap(){
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(screenWasDoubleTapped))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        view.addGestureRecognizer(doubleTap)
    }
    
    @objc func screenWasDoubleTapped(){
        dismiss(animated: true, completion: nil)
    }
    
}
