//
//  SimpleCallout.swift
//  SportsMap
//
//  Created by Sierra on 06.12.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class SimpleCallout: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit() 
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("SimpleCallout", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
