//
//  PlaceModel.swift
//  FoursquareClone37
//
//  Created by Luke Martin-Resnick on 9/30/20.
//

import Foundation
import UIKit

class PlaceModel {
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeAtmosphere = ""
    var placeImage = UIImage()
    var placeLatitude = ""
    var placeLongitude = ""
    
    private init() {}
}
