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
        //let rect = CGRect(x: 12, y: 11, width: 206, height: 97)
        //imageView.setNeedsDisplay(rect)
    }

}
