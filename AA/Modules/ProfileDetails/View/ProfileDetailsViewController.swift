//
//  ProfileDetailsViewController.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class ProfileDetailsViewController: BaseViewController {

    var presenter: ProfileDetailsPresenterProtocol!

    let tableView: UITableView = UITableView()
    let profileImage = UIImageView()
    let profileNameLabel = UILabel()
    let profileEmailLabel = UILabel()
    let profilePhoneLabel = UILabel()
    let profileEditButton = UIButton(type: .custom)
    
    let profileInfoCellId = "ProfileInfoCell"
    let profilePostCellId = "ProfilePostCell"
    
    var usersPosts: [PostModel] = [PostModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.presenter.fetchPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    private func createUI() {
        view.backgroundColor = .white
        
        tableView.estimatedRowHeight = 50
        tableView.contentInset = UIEdgeInsets(top: -100, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.contentOffset.y = -100
        tableView.separatorStyle = .none

        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: profileInfoCellId)
        tableView.register(ProfilePostCell.self, forCellReuseIdentifier: profilePostCellId)
        tableView.layer.masksToBounds = true
        
        profileEditButton.backgroundColor = Colors.apploverGreen
        profileEditButton.layer.cornerRadius = 33.withRatio()
        profileEditButton.clipsToBounds = false
        profileEditButton.setImage(UIImage(named: "pencil"), for: .normal)
        
        profileNameLabel.textColor = UIColor.white
        profileNameLabel.font = UIFont(name: "Raleway-SemiBold", size: 20.0)
        profileNameLabel.text = presenter.getUserModel().name
        
        profilePhoneLabel.textColor = UIColor.white
        profilePhoneLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        profilePhoneLabel.text = presenter.getUserModel().phone
        
        profileEmailLabel.textColor = UIColor.white
        profileEmailLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        profileEmailLabel.text = presenter.getUserModel().email
        
        profileImage.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 300)
        profileImage.image = UIImage(named: "poster")
        profileImage.contentMode = .scaleAspectFill
        
        view.addSubview(tableView)
        tableView.tableHeaderView = profileImage
        tableView.tableHeaderView?.addSubview(profileNameLabel)
        tableView.tableHeaderView?.addSubview(profilePhoneLabel)
        tableView.tableHeaderView?.addSubview(profileEmailLabel)
        tableView.addSubview(profileEditButton)
        tableView.layer.masksToBounds = false
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        profileEditButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(tableView.tableHeaderView!.snp.bottom)
            make.width.height.equalTo(66.withRatio())
            make.right.equalTo(profileImage.snp.right).offset(-31)
        }
        
        profilePhoneLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        profileEmailLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.bottom.equalTo(profilePhoneLabel.snp.top).offset(-8)
        }
        
        profileNameLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.bottom.equalTo(profileEmailLabel.snp.top).offset(-8)
        }

    }
}

extension ProfileDetailsViewController: ProfileDetailsViewProtocol {
    
    func insertPosts(posts: [PostModel]) {
        self.usersPosts.removeAll()
        self.usersPosts = posts
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ProfileDetailsViewController: UITableViewDelegate {}

extension ProfileDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersPosts.count+1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: profileInfoCellId, for: indexPath) as! ProfileInfoCell
            if let model = self.presenter?.getUserModel() {
                cell.display(user: model)
            }
            return cell
        } else {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: profilePostCellId, for: indexPath) as! ProfilePostCell
            cell.display(post: usersPosts[indexPath.row-1])
            return cell
        }
        
    }
}



