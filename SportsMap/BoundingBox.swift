//
//  BoundingBox.swift
//  SportsMap
//
//  Created by user on 11.12.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit
import YandexMapKit

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
    var UpLeft = YMKPoint()
    var BottomRight = YMKPoint()
    
    init(ULlon: Double, ULlat: Double, BRlon: Double, BRlat: Double) {
        self.UpLeft = YMKPoint(latitude: ULlat, longitude: ULlon)
        self.BottomRight = YMKPoint(latitude: BRlat, longitude: BRlon)
    }
    
    func stringBuild() -> NSString {
        return NSString(format: "%f,%f,%f,%f", self.UpLeft.longitude, self.UpLeft.latitude, self.BottomRight.longitude, self.BottomRight.latitude)
    }
}
