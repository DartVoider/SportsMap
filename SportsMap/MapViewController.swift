//
//  MapViewController.swift
//  SportsMap
//
//  Created by Sierra on 18.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit
import YandexMapKit

class MapViewController: UIViewController, YMKMapObjectTapListener {
    @IBOutlet var simpleCallout: SimpleCallout!
    @IBOutlet var fullCallout: FullCallout!
    //обработка нажатия
    func onMapObjectTap(with mapObject: YMKMapObject, point: YMKPoint) -> Bool {
        print(point.latitude," ", point.longitude)
        /*let view = YRTViewProvider(uiView: fullCallout)
        let mapObjects = mapView.mapWindow.map.mapObjects
        let placemark = mapObjects.addPlacemark(with: point)
        placemark.setViewWithView(view!)*/
        //fullCallout.imageView.image = UIImage(contentsOfFile: <#T##String#>)
        //fullCallout.imageView.image = UIImage(contentsOfFile: "2_pole_sochi.jpg")
        fullCallout.translatesAutoresizingMaskIntoConstraints = false
        mapView.addSubview(fullCallout)
        let guide = mapView.safeAreaLayoutGuide
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "[fullCallout]", options: [], metrics: nil, views: ["fullCallout": fullCallout]))
        NSLayoutConstraint.activate([
            fullCallout.topAnchor.constraint(equalTo: guide.topAnchor, constant: 100),
            fullCallout.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 100)])
        return true
    }
    
    @IBOutlet var mapView: YMKMapView!
    //тестовые точки на карте
    let TARGET_LOCATION1 = YMKPoint(latitude: 55.731808792856, longitude: 37.78091007338)
    let TARGET_LOCATION2 = YMKPoint(latitude: 55.69455687904856, longitude: 37.61882304504923)
    let TARGET_LOCATION3 = YMKPoint(latitude: 55.69552810278989, longitude: 37.61820076455685)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // подгружаем карты во вьюху
        showSimpleCallout(target: TARGET_LOCATION1, count: 6355)
        createPlacemark(target: TARGET_LOCATION2)
        createPlacemark(target: TARGET_LOCATION3)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: TARGET_LOCATION1, zoom: 15, azimuth: 0, tilt: 0),
            animationType: YMKAnimation(type: YMKAnimationType.linear, duration: 5),
            cameraCallback: nil)
    }
    //создание обычных маркеров на карте
    func createPlacemark( target:YMKPoint) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        let placemark = mapObjects.addPlacemark(with: target)
        placemark.opacity = 1
        placemark.setIconWith(UIImage(named:"SearchResult")!)
        placemark.addTapListener(with: self)
    }
    //создание маркеров с отображением номера
    func showSimpleCallout(target:YMKPoint, count:Int){
        let mapObjects = mapView.mapWindow.map.mapObjects
        let placemark = mapObjects.addPlacemark(with: target)
        simpleCallout.countLabel.text = String(count)
        placemark.opacity = 1
        placemark.setIconWith(convertViewToImage(simpleCallout)!)
        placemark.addTapListener(with: self)
    }
    //конвертация вьюхи в картинку (необходима для корректного отображения круглого маркера)
    private func convertViewToImage(_ view: UIView) -> UIImage? {
        let size = CGSize(width: view.bounds.size.width, height: view.bounds.size.height + 20)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        if let aContext = UIGraphicsGetCurrentContext() {
            view.layer.render(in: aContext)
        }
        let img: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
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
