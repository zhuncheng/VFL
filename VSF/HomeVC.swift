//
//  HomeVC.swift
//  VSF
//
//  Created by Thea Chum on 29/9/21.
//

import UIKit

class HomeVC: UIViewController {

    let tableView : UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    var vContainer : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setupViews() {
        
//        self.tableView.backgroundColor = .white
//        self.tableView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(tableView)
        vContainer = UIView()
        vContainer.backgroundColor = UIColor.red
        vContainer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(vContainer)
        
        
        let HVContainer = "H:[vContainer(200)]"
        let VVContainer = "V:[vContainer(150)]"
        
        let vDic = ["vContainer": vContainer]
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: HVContainer,
                                                                   options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                   metrics: nil,
                                                                   views: vDic)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: VVContainer,
                                                                 options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                 metrics: nil,
                                                                 views: vDic)
        
        self.view.addConstraints(horizontalConstraints)
        self.view.addConstraints(verticalConstraints)
    }

}
