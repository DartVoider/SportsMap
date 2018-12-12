//
//  FullCallout.swift
//  SportsMap
//
//  Created by Sierra on 07.12.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class FullCallout: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    @IBAction func closeButtonTap(_ sender: Any) {
        removeFromSuperview()
    }
    @IBAction func mainButtonTap(_ sender: Any) {
        print("Button Tap")
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let detailVC = segue.destination as? detailViewController
            print("buttontapseague")
            detailVC!.hasEquip.text = "Возможна аренда инвентаря: "// + item.equip
            detailVC!.hasDroom.text = "Есть раздевалки: "// + item.droom
            detailVC!.hasToilet.text = "Есть туалеты: "// + item.toilet
            detailVC!.hasWifi.text = "Есть Wi-Fi: "// + item.wifi
            detailVC!.hasATM.text = "Есть банкомат: "// + item.atm
            detailVC!.hasFirstaid.text = "Есть медпункт: "// + item.firstaid
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("FullCallout", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds 
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
      //  mainButton.addTarget(self, action: #selector(detailViewController.ObjectInfo(sender:)), for: .touchUpInside)
        //let rect = CGRect(x: 12, y: 11, width: 206, height: 97)
        //imageView.setNeedsDisplay(rect)
    }
    
    /*func ObjectInfo(sender: UIButton){
        performSegue(withIdentifier: "showDetails", sender: self)
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let vc = segue.destination as? detailViewController
            print("buttontapseague")
        }
    }*/

}
