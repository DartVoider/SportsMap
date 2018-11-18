//
//  MapViewController.swift
//  SportsMap
//
//  Created by Sierra on 18.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit
import YandexMapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: YMKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // подгружаем карты во вьюху
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: YMKPoint(latitude: 55.751574, longitude: 37.573856), zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.linear, duration: 5),
            cameraCallback: nil)
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
