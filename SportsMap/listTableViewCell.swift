//
//  listTableViewCell.swift
//  SportsMap
//
//  Created by user on 20.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class listTableViewCell: UITableViewCell {
    @IBOutlet weak var groundName: UILabel!
    @IBOutlet weak var groundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib() 
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
