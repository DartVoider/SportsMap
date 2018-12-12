//
//  BoundingBox.swift
//  SportsMap
//
//  Created by user on 11.12.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

struct GeoPoint {
    var longitude = 0 as Double
    var latitude = 0 as Double
}

extension GeoPoint {
    init?(lon: Double, lat: Double) {
        self.longitude = lon
        self.latitude = lat
    }
}

class BoundingBox: NSObject {
    var UpLeft = GeoPoint()
    var BottomRight = GeoPoint()
    
    init(ULlon: Double, ULlat: Double, BRlon: Double, BRlat: Double) {
        self.UpLeft.longitude = ULlon
        self.UpLeft.latitude = ULlat
        self.BottomRight.longitude = BRlon
        self.BottomRight.latitude = BRlat
    }
    
    func stringBuild() -> NSString {
        return NSString(format: "%f,%f,%f,%f", self.UpLeft.longitude, self.UpLeft.latitude, self.BottomRight.longitude, self.BottomRight.latitude)
    }
}
