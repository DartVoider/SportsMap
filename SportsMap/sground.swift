//
//  sground.swift
//  SportsMap
//
//  Created by user on 20.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import Foundation
import YandexMapKit

struct SGround {
    let geometry : YMKPoint
    let name: String
    let address: String
    let website: String
    let phone: String
    let equip: String
    let droom: String
    let toilet: String
    let wifi: String
    let atm: String
    let firstaid: String
    let paid: String
    
}

extension SGround {
    init?(ground_data: NSDictionary) {
        guard
            let geometry_info = ground_data["geometry"] as? NSDictionary,
            let geometry_data = geometry_info["coordinates"] as? NSArray,
            let long = geometry_data.firstObject as? Double,
            let lati = geometry_data.lastObject as? Double,
//            let geometry = YMKPoint(latitude: lati, longitude:  long),
            let ground_prop = ground_data["properties"] as? NSDictionary,
            let ground_info = ground_prop["Attributes"] as? NSDictionary,
            let name = ground_info["ObjectName"] as? String,
            let address = ground_info["Address"] as? String,
            let website = ground_info["WebSite"] as? String,
            let phone = ground_info["HelpPhone"] as? String,
            let equip = ground_info["HasEquipmentRental"] as? String,
            let droom = ground_info["HasDressingRoom"] as? String,
            let toilet = ground_info["HasToilet"] as? String,
            let wifi = ground_info["HasWifi"] as? String,
            let atm = ground_info["HasCashMachine"] as? String,
            let firstaid = ground_info["HasFirstAidPost"] as? String,
            let paid = ground_info["Paid"] as? String
            else { return nil }

        self.geometry = YMKPoint(latitude: lati, longitude: long)
        self.name = name
        self.address = address
        self.website = website
        self.phone = phone
        self.equip = equip
        self.droom = droom
        self.toilet = toilet
        self.wifi = wifi
        self.atm = atm
        self.firstaid = firstaid
        self.paid = paid
        
        print(self.name)
    }
}
