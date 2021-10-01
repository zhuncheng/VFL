//
//  DetailVC.swift
//  VSF
//
//  Created by Thea on 29/9/21.
//

import UIKit

class DetailVC: UIViewController {

    let containerView : UIView = {
        let imgView = UIView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.backgroundColor = UIColor.white
        imgView.layer.cornerRadius = 20
        
        return imgView
    }()
    
    let profileImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "shinchan")
        imgView.backgroundColor     = .red
        imgView.layer.cornerRadius  = 15
        imgView.clipsToBounds       = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.text            = "Crayon Shin Chan"
        lbl.textAlignment   = .left
        lbl.textColor       = UIColor.red
        lbl.font            = UIFont.boldSystemFont(ofSize: 20)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblID : UILabel = {
        let lbl = UILabel()
        lbl.text            = "2000001"
        lbl.textAlignment   = .left
        lbl.textColor       = UIColor.red
        lbl.font            = UIFont.systemFont(ofSize: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let verifyEmailView : UIView = {
        let v = UIView()
        v.backgroundColor = .systemPink
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        return v
    }()
    
    let imgViewEmail : UIImageView = {
        let imgView = UIImageView()
        imgView.layer.cornerRadius  = 15
        imgView.clipsToBounds       = false
        
        imgView.image = UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill")
        imgView.tintColor = .black
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    let lblVerifyEmailTitle : UILabel = {
        let lbl = UILabel()
        lbl.text = "Please verify your email"
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lblVerifyEmailValue : UILabel = {
        let lbl = UILabel()
        lbl.text = "Please press exit button if not your email!"
        lbl.textColor = UIColor.black
        lbl.font = UIFont.systemFont(ofSize: 15)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let btnEmailClose : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        btn.tintColor = .black
        btn.setTitleColor(.red, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
        
    }()
    
    let tableView : UITableView = {
        let t = UITableView()
        t.backgroundColor = .systemPink
        t.translatesAutoresizingMaskIntoConstraints = false
        t.layer.cornerRadius = 15
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addImageView()
        addProfileImgViewToContainerView()
        addLblTitle()
        addLblID()
        
        addVerifyEmailView()
        
        addTableView()
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private
    func setupViews() {
        self.view.backgroundColor = .red
    }
    
}

extension DetailVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        
        cell.didTapPreviewImageCompletion = {
            let vc = PreviewPhotoVC()
            
            self.present(vc, animated: true) {}
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension DetailVC {
    
    private
    func addImageView() {
        self.view.addSubview(containerView)
        
        let vflImgView = "V:|-44-[containerView]-21-|"
        let hflImgView = "H:|-21-[containerView]-21-|"
        
        let vCstImgView = NSLayoutConstraint.constraints(withVisualFormat: vflImgView, options: [], metrics: nil, views: ["containerView": containerView])
        let hCstImgView = NSLayoutConstraint.constraints(withVisualFormat: hflImgView, options: [], metrics: nil, views: ["containerView": containerView])
        
        self.view.addConstraints(vCstImgView)
        self.view.addConstraints(hCstImgView)
    }
    
    private
    func addProfileImgViewToContainerView() {
        self.containerView.addSubview(profileImageView)
        
        let vProfileImgView = "V:|-21-[profileImgView(80)]"
        let hProfileImgView = "H:|-21-[profileImgView(80)]"
        
        let vCstProfileImgView = NSLayoutConstraint.constraints(withVisualFormat: vProfileImgView, options: [], metrics: nil, views: ["profileImgView": profileImageView])
        let hCstProfileImgView = NSLayoutConstraint.constraints(withVisualFormat: hProfileImgView, options: [], metrics: nil, views: ["profileImgView": profileImageView])
        
        self.containerView.addConstraints(vCstProfileImgView)
        self.containerView.addConstraints(hCstProfileImgView)
    }
    
    private
    func addLblTitle() {
        self.containerView.addSubview(lblTitle)
        
        let vflLblTitle = "V:|-21-[lblTitle(34)]"
        let hflLblTitle = "H:[profileImgView]-15-[lblTitle]-21-|"
        
        let dic = ["lblTitle": lblTitle, "profileImgView": profileImageView]
        
        let vCstLblTitle = NSLayoutConstraint.constraints(withVisualFormat: vflLblTitle, options: [], metrics: nil, views: dic)
        let hCstLblTitle = NSLayoutConstraint.constraints(withVisualFormat: hflLblTitle, options: [], metrics: nil, views: dic)
        
        self.containerView.addConstraints(vCstLblTitle)
        self.containerView.addConstraints(hCstLblTitle)
    }
    
    private
    func addLblID() {
        self.containerView.addSubview(lblID)
        
        let vflLblTitle = "V:[lblTitle]-2-[lblID(21)]"
        let hflLblTitle = "H:[profileImgView]-15-[lblID]-21-|"
        
        let dic = ["lblID": lblID, "profileImgView": profileImageView, "lblTitle": lblTitle]
        
        let vCstLblTitle = NSLayoutConstraint.constraints(withVisualFormat: vflLblTitle, options: [], metrics: nil, views: dic)
        let hCstLblTitle = NSLayoutConstraint.constraints(withVisualFormat: hflLblTitle, options: [], metrics: nil, views: dic)
        
        self.containerView.addConstraints(vCstLblTitle)
        self.containerView.addConstraints(hCstLblTitle)
    }
    
    private
    func addVerifyEmailView() {
        self.containerView.addSubview(verifyEmailView)
        
        let vflVerifyEmailView = "V:[profileImageView]-21-[verifyEmailView(80)]"
        let hflVerifyEmailView = "H:|-21-[verifyEmailView]-21-|"
        
        let dic = ["verifyEmailView": verifyEmailView, "profileImageView" : profileImageView]
        
        let vCstVerifyEmailView = NSLayoutConstraint.constraints(withVisualFormat: vflVerifyEmailView, options: [], metrics: nil, views: dic)
        let hCstVerifyEmailView = NSLayoutConstraint.constraints(withVisualFormat: hflVerifyEmailView, options: [], metrics: nil, views: dic)
        
        self.containerView.addConstraints(vCstVerifyEmailView)
        self.containerView.addConstraints(hCstVerifyEmailView)
        
        self.verifyEmailView.addSubview(imgViewEmail)
        self.verifyEmailView.addSubview(lblVerifyEmailTitle)
        self.verifyEmailView.addSubview(lblVerifyEmailValue)
        self.verifyEmailView.addSubview(btnEmailClose)
        
        // email image view
        let vflEmailImgView = "V:|-[imgViewEmail(64)]"
        let hflEmailImgView = "H:|-[imgViewEmail(64)]"
        
        let dicEmail = ["imgViewEmail" : imgViewEmail]
        let vCstEmailImgView = NSLayoutConstraint.constraints(withVisualFormat: vflEmailImgView, options: [], metrics: nil, views: dicEmail)
        let hCstEmailImgView = NSLayoutConstraint.constraints(withVisualFormat: hflEmailImgView, options: [], metrics: nil, views: dicEmail)
        
        self.verifyEmailView.addConstraints(vCstEmailImgView)
        self.verifyEmailView.addConstraints(hCstEmailImgView)
        
        // email title label
        let vflLblEmailTitle = "V:|-[lblVerifyEmailTitle(25)]"
        let hflLblEmailTitle = "H:[imgViewEmail]-[lblVerifyEmailTitle]"
        
        let dicEmailTitle = ["lblVerifyEmailTitle" : lblVerifyEmailTitle, "imgViewEmail": imgViewEmail]
        
        let vCstLblEmailTitle = NSLayoutConstraint.constraints(withVisualFormat: vflLblEmailTitle, options: [], metrics: nil, views: dicEmailTitle)
        let hCstLblEmailTitle = NSLayoutConstraint.constraints(withVisualFormat: hflLblEmailTitle, options: [], metrics: nil, views: dicEmailTitle)
        
        self.verifyEmailView.addConstraints(vCstLblEmailTitle)
        self.verifyEmailView.addConstraints(hCstLblEmailTitle)
        
        // email value label
        let vflLblEmailValue = "V:[lblVerifyEmailTitle]-[lblVerifyEmailValue(25)]"
        let hflLblEmailValue = "H:[imgViewEmail]-[lblVerifyEmailValue]-[btnEmailClose]"
        
        let dicEmailValue = ["lblVerifyEmailValue" : lblVerifyEmailValue, "imgViewEmail": imgViewEmail, "lblVerifyEmailTitle": lblVerifyEmailTitle, "btnEmailClose" : btnEmailClose] as [String : Any]
        
        let vCstLblEmailValue = NSLayoutConstraint.constraints(withVisualFormat: vflLblEmailValue, options: [], metrics: nil, views: dicEmailValue)
        let hCstLblEmailValue = NSLayoutConstraint.constraints(withVisualFormat: hflLblEmailValue, options: [], metrics: nil, views: dicEmailValue)
        
        self.verifyEmailView.addConstraints(vCstLblEmailValue)
        self.verifyEmailView.addConstraints(hCstLblEmailValue)
        
        
        
        // email value label
        
        let vflBtnEmailClose = "V:[btnEmailClose(64)]-|"
        let hflBtnEmailClose = "H:[btnEmailClose(24)]-|"
        
        let dicBtnEmailClose = ["btnEmailClose" : btnEmailClose]
        
        let vCstBtnEmailClose = NSLayoutConstraint.constraints(withVisualFormat: vflBtnEmailClose, options: [], metrics: nil, views: dicBtnEmailClose)
        let hCstBtnEmailClose = NSLayoutConstraint.constraints(withVisualFormat: hflBtnEmailClose, options: [], metrics: nil, views: dicBtnEmailClose)
        
        self.verifyEmailView.addConstraints(vCstBtnEmailClose)
        self.verifyEmailView.addConstraints(hCstBtnEmailClose)
    }
    
    func addTableView() {
        self.containerView.addSubview(tableView)
        let vflBtnEmailClose = "V:[verifyEmailView]-21-[tableView]-|"
        let hflBtnEmailClose = "H:|-21-[tableView]-21-|"
        
        let dicBtnEmailClose = ["tableView" : tableView, "verifyEmailView": verifyEmailView]
        
        let vCstBtnEmailClose = NSLayoutConstraint.constraints(withVisualFormat: vflBtnEmailClose, options: [], metrics: nil, views: dicBtnEmailClose)
        let hCstBtnEmailClose = NSLayoutConstraint.constraints(withVisualFormat: hflBtnEmailClose, options: [], metrics: nil, views: dicBtnEmailClose)
        
        self.containerView.addConstraints(vCstBtnEmailClose)
        self.containerView.addConstraints(hCstBtnEmailClose)
    }
}

class ProfileCell : UITableViewCell {
    
    let imgViewIcon : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.fill")
        img.tintColor           = .black
        img.layer.cornerRadius  = 4
        img.clipsToBounds       = false
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let lblTitle : UILabel = {
        let lbl = UILabel()
        lbl.textColor   = UIColor.black
        lbl.font        = UIFont.boldSystemFont(ofSize: 15)
        lbl.text        = "Profile"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let btnMore : UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let photoImgView : UIImageView = {
       let imgView = UIImageView()
        imgView.backgroundColor     = .white
        imgView.layer.cornerRadius  = 15
        imgView.clipsToBounds       = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        
        imgView.isUserInteractionEnabled = true
        
        return imgView
    }()
    
    var didTapPreviewImageCompletion : () -> () = {}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        self.addIconImgView()
        self.addLblTitle()
        self.addBtnMore()
        self.addPhotoImgView()
        
        photoImgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPhoto)))
        
        photoImgView.addInteraction(UIContextMenuInteraction(delegate: self))
    }

    @objc func openPhoto() {
        print("Meow Meow")
        self.photoImgView.animateCurveOutIn(withDuration: 1, delay: 0.2) {
            self.didTapPreviewImageCompletion()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func addIconImgView() {
        contentView.addSubview(imgViewIcon)
        
        let vflImgViewIcon = "V:|-21-[imgViewIcon(24)]"
        let hflImgViewIcon = "H:|-15-[imgViewIcon(24)]"
        
        let dic = ["imgViewIcon": imgViewIcon]
        let vCstImgViewIcon = NSLayoutConstraint.constraints(withVisualFormat: vflImgViewIcon, options: [], metrics: nil, views: dic)
        let hCstImgViewIcon = NSLayoutConstraint.constraints(withVisualFormat: hflImgViewIcon, options: [], metrics: nil, views: dic)
        
        contentView.addConstraints(vCstImgViewIcon)
        contentView.addConstraints(hCstImgViewIcon)
    }
    
    func addLblTitle() {
        contentView.addSubview(lblTitle)
        
        let vflLblTitle = "V:|-21-[lblTitle(24)]"
        let hflLblTitle = "H:[imgViewIcon]-15-[lblTitle]"
        
        let dic = ["lblTitle": lblTitle, "imgViewIcon": imgViewIcon]
        let vCstlLblTitle = NSLayoutConstraint.constraints(withVisualFormat: vflLblTitle, options: [], metrics: nil, views: dic)
        let hCstlLblTitle = NSLayoutConstraint.constraints(withVisualFormat: hflLblTitle, options: [], metrics: nil, views: dic)
        
        contentView.addConstraints(vCstlLblTitle)
        contentView.addConstraints(hCstlLblTitle)
    }
    
    func addBtnMore() {
        contentView.addSubview(btnMore)
        
        let vflLblTitle = "V:|-21-[btnMore(24)]"
        let hflLblTitle = "H:[lblTitle]-15-[btnMore(24)]-24-|"
        
        let dic = ["btnMore": btnMore, "lblTitle": lblTitle]
        let vCstlLblTitle = NSLayoutConstraint.constraints(withVisualFormat: vflLblTitle, options: [], metrics: nil, views: dic)
        let hCstlLblTitle = NSLayoutConstraint.constraints(withVisualFormat: hflLblTitle, options: [], metrics: nil, views: dic)
        
        contentView.addConstraints(vCstlLblTitle)
        contentView.addConstraints(hCstlLblTitle)
    }
    
    func addPhotoImgView() {
        contentView.addSubview(photoImgView)
        
        let vflPhotoImgView = "V:[imgViewIcon]-25-[photoImgView]-|"
        let hflPhotoImgView = "H:|-[photoImgView]-|"
        let dic =  ["photoImgView": photoImgView, "imgViewIcon": imgViewIcon]
        
        let vCstPhotoImgView = NSLayoutConstraint.constraints(withVisualFormat: vflPhotoImgView, options: [], metrics: nil, views: dic)
        let hCstPhotoImgView = NSLayoutConstraint.constraints(withVisualFormat: hflPhotoImgView, options: [], metrics: nil, views: dic)
        
        contentView.addConstraints(vCstPhotoImgView)
        contentView.addConstraints(hCstPhotoImgView)
    }
}

extension ProfileCell : UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
            
            // Create an action for sharing
            let share = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
                // Show system share sheet
            }

            // Create an action for renaming
            let rename = UIAction(title: "Rename", image: UIImage(systemName: "square.and.pencil")) { action in
                // Perform renaming
            }

            // Here we specify the "destructive" attribute to show that it’s destructive in nature
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
                // Perform delete
            }

            // Create and return a UIMenu with all of the actions as children
            return UIMenu(title: "", children: [share, rename, delete])
        }
    }
    
}
