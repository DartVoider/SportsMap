//
//  detailViewController.swift
//  SportsMap
//
//  Created by user on 21.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var item: SGround?
    
    @IBOutlet weak var groundImage: UIImageView!
    @IBOutlet weak var groundName: UILabel!
    @IBOutlet weak var groundAddress: UILabel!
    
    @IBOutlet weak var paidStatus: UILabel!
    @IBOutlet weak var groundWebsite: UILabel!
    @IBOutlet weak var groundPhone: UILabel!
    @IBOutlet weak var hasEquip: UILabel!
    @IBOutlet weak var hasDroom: UILabel!
    @IBOutlet weak var hasToilet: UILabel!
    @IBOutlet weak var hasWifi: UILabel!
    @IBOutlet weak var hasATM: UILabel!
    @IBOutlet weak var hasFirstaid: UILabel!
    @IBOutlet var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            groundName.text = item.name
            groundAddress.text = item.address
            paidStatus.text = item.paid
            groundWebsite.text = item.website
            groundPhone.text = item.phone
            hasEquip.text = "Возможна аренда инвентаря: " + item.equip
            hasDroom.text = "Есть раздевалки: " + item.droom
            hasToilet.text = "Есть туалеты: " + item.toilet
            hasWifi.text = "Есть Wi-Fi: " + item.wifi
            hasATM.text = "Есть банкомат: " + item.atm
            hasFirstaid.text = "Есть медпункт: " + item.firstaid
            imageView.image = UIImage(contentsOfFile: "2_pole_sochi.jpg")
        }
        // Do any additional setup after loading the view.
    }
    
    func ObjectInfo(sender: UIButton){
        performSegue(withIdentifier: "showDetails", sender: self)
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let vc = segue.destination as? detailViewController
            print("buttontapseague")
        }
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
