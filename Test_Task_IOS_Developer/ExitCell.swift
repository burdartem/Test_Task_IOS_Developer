//
//  ExitCell.swift
//  Test_Task_IOS_Developer
//
//  Created by Артем on 09/03/17.
//  Copyright © 2017 Artem. All rights reserved.
//

import UIKit

protocol ButtonDelegate: class {
    func onButtonTap(sender: UIButton)
}

class ExitCell: UITableViewCell {

    weak var delegate: ButtonDelegate?
    
    func onButtonTap(sender: UIButton) {
        
        delegate?.onButtonTap(sender: sender)
    }
    
    @IBAction func exitButtonAction(_ sender: Any) {
        onButtonTap(sender: sender as! UIButton)
    }
}
