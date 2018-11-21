//
//  sground.swift
//  SportsMap
//
//  Created by user on 20.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import Foundation

struct SGround {
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
            let ground_info = ground_data["Cells"] as? NSDictionary,
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
