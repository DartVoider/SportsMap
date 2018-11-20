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
    //тестовые точки на карте
    let TARGET_LOCATION1 = YMKPoint(latitude: 55.85222, longitude: 37.61556)
    let TARGET_LOCATION2 = YMKPoint(latitude: 55.75245, longitude: 37.67500)
    let TARGET_LOCATION3 = YMKPoint(latitude: 55.15234, longitude: 37.59545)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // подгружаем карты во вьюху
        createPlacemark(target: TARGET_LOCATION1)
        createPlacemark(target: TARGET_LOCATION2)
        createPlacemark(target: TARGET_LOCATION3)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: TARGET_LOCATION1, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.linear, duration: 5),
            cameraCallback: nil)
        // Do any additional setup after loading the view.
    }
    //создание маркеров на карте
    func createPlacemark( target:YMKPoint) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        //mapObjects.addTapListener(with: self as! YMKMapObjectTapListener)
        let placemark = mapObjects.addPlacemark(with: target)
        placemark.opacity = 1
        placemark.setIconWith(UIImage(named:"SearchResult")!)
    }
    //коллауты пока не работают
    /*private func showcallout( point: YMKPoint) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        let testRedView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 2.0))
        testRedView.backgroundColor = UIColor.red
        let img = convertViewToImage(testRedView)
        let x = 0.5
        //let x = getAnchor(for: paint) ? 8.65 : 8.5
        let tappableArea = YMKRect(min: CGPoint(x: 9, y: 8), max: CGPoint(x: 1, y: 1 ))
        let style = YMKIconStyle(anchor: NSValue(cgPoint: CGPoint(x: 1, y: 1)),
                                 rotationType: nil,
                                 zIndex: NSNumber(value: 100),
                                 flat: NSNumber(value: 0),
                                 visible: NSNumber(value: 1),
                                 scale: NSNumber(value: 1),
                                 tappableArea: tappableArea)
        style.anchor = NSValue(cgPoint: CGPoint(x: x, y: 1.05))
        let callout = WBCalloutView(frame: CGRect(x: 0, y: 0, width: CGFloatcalloutWidth), height: CGFloat(calloutHeight)))
        callaut.setup(annotation: selectedAnnotation)
        placemark = mapObjects.addPlacemark(with: point, image: img, style: style)
        placemark?.opacity = 1
        placematk?.zIndex = 18
        setCenterCamera(to: placemark! .geometry)
    }
    
    private func convertViewToImage(_ view: UIView) -> UIImage?{
        let size = CGSize(width: view.bounds.size.width, height: view.bounds.size.height + 20)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        if let aContext = UIGraphicsGetCurrentContext() {
            view.layer.render(in: aContext)
        }
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
