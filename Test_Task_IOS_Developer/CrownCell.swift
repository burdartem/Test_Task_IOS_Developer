//
//  CrownCell.swift
//  Test_Task_IOS_Developer
//
//  Created by Артем on 09/03/17.
//  Copyright © 2017 Artem. All rights reserved.
//

import UIKit

class CrownCell: UITableViewCell {
    
    @IBOutlet weak var crownImage: UIImageView!
    
    @IBOutlet weak var priceForOne: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var buyButton: UIButton!{
        didSet{
            buyButton.layer.borderWidth = 1.0
            buyButton.layer.borderColor = UIColor(red: 47/255, green: 149/255, blue: 255/255, alpha: 1.0).cgColor
        }
    }
}
