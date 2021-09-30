//
//  ViewController.swift
//  VSF
//
//  Created by Thea Chum on 29/9/21.
//

import UIKit

class ViewController: UIViewController {

    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.yellow
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var vContainer : UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.red
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        tableView.register(HomeCell.self, forCellReuseIdentifier: "HomeCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupViews() {
        let NavCon = UINavigationController(rootViewController: self)
        
        
        self.view.addSubview(vContainer)
        self.vContainer.addSubview(tableView)
        
        
        let HVContainer = "H:|-[vContainer]-|"
        let VVContainer = "V:|-[vContainer]-21-|"
        
        let vContainerDic = ["vContainer": vContainer]
        
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: HVContainer,
                                                                   options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                   metrics: nil,
                                                                   views: vContainerDic)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: VVContainer,
                                                                 options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                 metrics: nil,
                                                                 views: vContainerDic)
        self.view.addConstraints(horizontalConstraints)
        self.view.addConstraints(verticalConstraints)
        
        
        let HTableView = "H:|-[tableView]-|"
        let VTableView = "V:|-[tableView]-|"
        
        let tableViewDic = ["tableView": tableView]
        
        let hCst = NSLayoutConstraint.constraints(withVisualFormat: HTableView, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: tableViewDic)
        let vCst = NSLayoutConstraint.constraints(withVisualFormat: VTableView, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: tableViewDic)
        
        self.view.addConstraints(hCst)
        self.view.addConstraints(vCst)
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: {})
    }
    
    
}

class HomeCell : UITableViewCell {
    
    let lblTitle : UILabel = {
       let lbl = UILabel()
        lbl.text        = "Crayon Shin Chan"
        lbl.textColor   = UIColor.red
        lbl.font        = UIFont.boldSystemFont(ofSize: 20)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let imgView : UIImageView = {
        let imgView = UIImageView()
        
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(lblTitle)
        
        setupLblTitle()
       
    }
    
    func setupLblTitle() {
        let vVFLblTitle     = "V:|-21-[lblTitle]-|"
        let lblTitleDic     = ["lblTitle": lblTitle]
        let vLblTitleCst    = NSLayoutConstraint.constraints(withVisualFormat: vVFLblTitle, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: lblTitleDic)
        
        let hVFLblTitle     = "H:|-21-[lblTitle]-|"
        let hLblTitleCst    = NSLayoutConstraint.constraints(withVisualFormat: hVFLblTitle, options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: lblTitleDic)
        
        self.contentView.addConstraints(vLblTitleCst)
        self.contentView.addConstraints(hLblTitleCst)
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    
}

