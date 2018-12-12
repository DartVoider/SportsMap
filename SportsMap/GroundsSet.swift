//
//  GroundsSet.swift
//  SportsMap
//
//  Created by user on 11.12.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class GroundsSet: NSObject {
    
    var set = [SGround]()
    
    func getGrounds(bbox: BoundingBox) {
        print("mukalo")
        let urlString = String(format: "https://apidata.mos.ru/v1/datasets/%i/features?api_key=c3553d2754398b41bd1cbeea416e5d39&bbox=%@", 886 /*menu.getDatasetID()*/, bbox.stringBuild())
        guard let url = URL(string: urlString) else {
            print("oh no")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                self.parseGrounds(from: json)
            } catch {
                print(error.localizedDescription)
            }
            }.resume()
    }
    
    func parseGrounds(from json: Any) {
        guard let groundsDict = json as? NSDictionary else {
            print("Parsing error")
            return
        }
        guard let groundsArray = groundsDict["features"] as? NSArray else {
            print("Parsing error")
            return
        }
        
        for i in groundsArray {
            guard let groundDict = i as? NSDictionary,
                let ground = SGround(ground_data: groundDict) else {
                    print("ololo error")
                    continue }
            self.set.append(ground)
            print(ground.name)
            
        }
        print(self.set)
    }

}
