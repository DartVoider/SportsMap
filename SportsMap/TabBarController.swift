//
//  TabBarController.swift
//  SportsMap
//
//  Created by Sierra on 19.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class TabBarController: UITabBarController {
    @IBOutlet var navItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = ["Футбол", "Баскетбол", "Волейбол"]
        
        // создаем выпадающую менюшку
        let menuView = BTNavigationDropdownMenu(title: BTTitle.index(1), items: items)
        menuView.animationDuration = 0; // без анимации
        
        self.navItem.titleView = menuView 
        
        // по выбору меняем заголовок и, если необходимо, запоминаем выбор в self
        menuView.didSelectItemAtIndexHandler = {[] (indexPath: Int) -> () in
           // self.selectedCellLabel.text = items[indexPath]
        }
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
