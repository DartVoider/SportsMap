//
//  subView.swift
//  SportsMap
//
//  Created by Sierra on 12.12.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class subView: UIView {
    @IBAction func tapCancel(_ sender: Any) {
        removeFromSuperview()
    }
    @IBOutlet var image: UIImageView!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
