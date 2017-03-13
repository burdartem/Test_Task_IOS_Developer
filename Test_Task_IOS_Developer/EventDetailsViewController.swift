//
//  MainViewController.swift
//  Test_Task_IOS_Developer
//
//  Created by Артем on 09/03/17.
//  Copyright © 2017 Artem. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UINib(nibName: "HeaderImageCell", bundle: nil) , forCellReuseIdentifier: "HeaderImageCell")
            tableView.register(UINib(nibName: "TextCell", bundle: nil) , forCellReuseIdentifier: "TextCell")
            tableView.register(UINib(nibName: "CrownCell", bundle: nil) , forCellReuseIdentifier: "CrownCell")
            tableView.register(UINib(nibName: "ExtraCrownCell", bundle: nil) , forCellReuseIdentifier: "ExtraCrownCell")
            tableView.register(UINib(nibName: "ExitCell", bundle: nil) , forCellReuseIdentifier: "ExitCell")
            
            tableView.layer.cornerRadius = 5.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurEffectView, at: 0)
    }
}

extension EventDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 6
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderImageCell", for: indexPath) as! HeaderImageCell
            
            cell.animateOval()
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CrownCell", for: indexPath) as! CrownCell
            
            cell.crownImage.image = #imageLiteral(resourceName: "Crown1")
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CrownCell", for: indexPath) as! CrownCell
            
            cell.crownImage.image = #imageLiteral(resourceName: "Crown3")
            cell.priceForOne.text = "129₽"
            cell.price.text = "390"
            
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraCrownCell", for: indexPath) as! ExtraCrownCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExitCell", for: indexPath) as! ExitCell
            cell.delegate = self
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 133.0
        } else if indexPath.row == 1 {
            return 102.0
        } else if indexPath.row == 2 || indexPath.row == 3 {
            return 76.0
        } else if indexPath.row == 4 {
            return 91.0
        } else {
            return 63.0
        }
        
    }
}

extension EventDetailsViewController: ButtonDelegate {
    
    func onButtonTap(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
