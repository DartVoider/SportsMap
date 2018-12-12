//
//  MapViewController.swift
//  SportsMap
//
//  Created by Sierra on 18.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit
import YandexMapKit

class MapViewController: UIViewController, YMKMapObjectTapListener, YMKMapSizeChangedListener, YMKMapCameraListener, YMKInertiaMoveListener, YMKMapInputListener, YMKLocationSimulatorListener  {
    func onSimulationFinished() {
        print("SimulationFinish")
    }
    
    func onMapTap(with map: YMKMap, point: YMKPoint) {
        print("MapTap")
    }
    
    func onMapLongTap(with map: YMKMap, point: YMKPoint) {
        print("MapLongTap")
    }
    
    func onStart(with map: YMKMap, finish finishCameraPosition: YMKCameraPosition) {
        print("Start")
    }
    
    func onCancel(with map: YMKMap, cameraPosition: YMKCameraPosition) {
        print("Cancel")
    }
    
    func onFinish(with map: YMKMap, cameraPosition: YMKCameraPosition) {
        print("Finish")
    }
    
    func onCameraPositionChanged(with map: YMKMap, cameraPosition: YMKCameraPosition, cameraUpdateSource: YMKCameraUpdateSource, finished: Bool) {
        print(cameraPosition)
        print(cameraUpdateSource) 
    }
    
    @IBOutlet var simpleCallout: SimpleCallout!
    @IBOutlet var fullCallout: FullCallout!
    var heightConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    //обработка изменения размера
    func onMapWindowSizeChanged(with mapWindow: YMKMapWindow, newWidth: Int, newHeight: Int) {
        print(newHeight," ",newWidth)
    }
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
            fullCallout.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 50)])
        heightConstraint = NSLayoutConstraint(item: fullCallout, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 180.0)
        widthConstraint = NSLayoutConstraint(item: fullCallout, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 230.0)
        fullCallout.addConstraint(heightConstraint)
        fullCallout.addConstraint(widthConstraint)
        return true
    }
    
    @IBOutlet var mapView: YMKMapView!
    //тестовые точки на карте
    let CAO = YMKPoint(latitude: 55.754492, longitude: 37.622453)
    let SAO = YMKPoint(latitude: 55.838384, longitude: 37.525765)
    let SVAO = YMKPoint(latitude: 55.863894, longitude: 37.620923)
    let VAO = YMKPoint(latitude: 55.787710, longitude: 37.775631)
    let YVAO = YMKPoint(latitude: 55.692019, longitude: 37.754583)
    let YAO = YMKPoint(latitude: 55.610906, longitude: 37.681479)
    let YZAO = YMKPoint(latitude: 55.662735, longitude: 37.576178)
    let ZAO = YMKPoint(latitude: 55.728003, longitude: 37.443533)
    let SZAO = YMKPoint(latitude: 55.829370, longitude: 37.451546)
    let ZelAO = YMKPoint(latitude: 55.987583, longitude: 37.194250)
    let NAO = YMKPoint(latitude: 55.558121, longitude: 37.370724)
    let TAO = YMKPoint(latitude: 55.355771, longitude: 37.146990)
    let TARGET_LOCATION1 = YMKPoint(latitude: 55.731808792856, longitude: 37.78091007338)
    let TARGET_LOCATION2 = YMKPoint(latitude: 55.69455687904856, longitude: 37.61882304504923)
    let TARGET_LOCATION3 = YMKPoint(latitude: 55.69552810278989, longitude: 37.61820076455685)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // подгружаем карты во вьюху
        showSimpleCallout(target: CAO, value: "ЦАО")
        showSimpleCallout(target: SAO, value: "САО")
        showSimpleCallout(target: SVAO, value: "СВАО")
        showSimpleCallout(target: VAO, value: "ВАО")
        showSimpleCallout(target: YVAO, value: "ЮВАО")
        showSimpleCallout(target: YAO, value: "ЮАО")
        showSimpleCallout(target: YZAO, value: "ЮЗАО")
        showSimpleCallout(target: ZAO, value: "ЗАО")
        showSimpleCallout(target: SZAO, value: "СЗАО")
        showSimpleCallout(target: ZelAO, value: "ЗАО")
        showSimpleCallout(target: NAO, value: "НАО")
        showSimpleCallout(target: TAO, value: "ТАО")
        createPlacemark(target: TARGET_LOCATION2)
        createPlacemark(target: TARGET_LOCATION3)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition.init(target: CAO, zoom: 10, azimuth: 0, tilt: 0)/*,
            animationType: YMKAnimation(type: YMKAnimationType.linear, duration: 3),
            cameraCallback: nil*/)
        mapView.mapWindow.addSizeChangedListener(with: self)
    }
    //создание маркеров на карте
    func createPlacemark( target:YMKPoint) {
        let mapObjects = mapView.mapWindow.map.mapObjects
        let placemark = mapObjects.addPlacemark(with: target)
        placemark.opacity = 1
        placemark.setIconWith(UIImage(named:"SearchResult")!)
        placemark.addTapListener(with: self)
    }
    //создание маркеров с отображением округа
    func showSimpleCallout(target:YMKPoint, value:String){
        let mapObjects = mapView.mapWindow.map.mapObjects
        let placemark = mapObjects.addPlacemark(with: target)
        simpleCallout.countLabel.text = value
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
