//
//  ProfilesViewController.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class ProfilesViewController: BaseViewController {

    var presenter: ProfilesPresenterProtocol!
    
    let tableView: UITableView = UITableView()
    let cellId = "ProfileCell"
    var users: [UserModel] = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ProfileCell.self, forCellReuseIdentifier: cellId)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.createUI()
        self.presenter.fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.view.backgroundColor = Colors.apploverGreen
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
         return .lightContent
    }
    
    private func createUI() {
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = "Profiles"
        
        self.tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)
        
        self.navigationController?.navigationBar.barTintColor = Colors.apploverGreen
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Raleway-Regular", size: 17.0)!]
        
        self.view.addSubview(tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension ProfilesViewController: ProfilesViewProtocol {
    func insertUsers(users: [UserModel]) {
        self.users.removeAll()
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ProfilesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.withRatio()
    }
}

extension ProfilesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.users[indexPath.row]
        self.presenter.didClick(user: model)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProfileCell
        let currentUser = users[indexPath.row]
        cell?.display(user: currentUser)
        return cell ?? UITableViewCell()
    }
    
    
}


