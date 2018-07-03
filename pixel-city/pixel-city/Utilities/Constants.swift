//
//  Constants.swift
//  pixel-city
//
//  Created by Oforkanji Odekpe on 5/29/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation

let API_KEY = ""

func flickrURL(forApiKey key: String, withAnnotation annotation: DroppablePin, andNumberOfPhotos number: Int) -> String{
    return "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(API_KEY)&lat=\(annotation.coordinate.latitude)&lon=\(annotation.coordinate.longitude)&radius=2&radius_units=km&per_page=\(number)&format=json&nojsoncallback=1"
}

func flickrInfoURL(forApiKey key: String, photoID id: String) -> String{
    return "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=\(API_KEY)&photo_id=\(id)&format=json&nojsoncallback=1"
}
