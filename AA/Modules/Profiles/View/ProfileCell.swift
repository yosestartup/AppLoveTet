//
//  ProfileCell.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class ProfileCell: UITableViewCell {
    private var profilePhoto: UIImageView = UIImageView()
    private var profileNameLabel: UILabel = UILabel()
    private var profileEmailLabel: UILabel = UILabel()
    private var profilePhoneLabel: UILabel = UILabel()
    private let cornerRadius: CGFloat = 6.0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        
        let container = UIView()
        container.backgroundColor = .white
        
        container.addSubview(profilePhoto)
        container.addSubview(profileNameLabel)
        container.addSubview(profileEmailLabel)
        container.addSubview(profilePhoneLabel)
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4.0
        
        container.layer.cornerRadius = cornerRadius
        container.layer.masksToBounds = true
        
        self.contentView.addSubview(container)
        
        self.profilePhoto.contentMode = .scaleAspectFit
        self.profilePhoto.image = UIImage(named: "Userpic")
        
        self.profileNameLabel.textColor = UIColor.black
        self.profileNameLabel.font = UIFont(name: "Raleway-Regular", size: 16.0)
        
        self.profileEmailLabel.textColor = Colors.textGrey
        self.profileEmailLabel.font = UIFont(name: "Raleway-Regular", size: 12.0)
        
        self.profilePhoneLabel.textColor = Colors.textGrey
        self.profilePhoneLabel.font = UIFont(name: "Raleway-Regular", size: 12.0)
        
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.profilePhoto.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12.withRatio())
            make.bottom.equalToSuperview().offset(-12.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
            make.width.height.equalTo(40.withRatio())
        }
        
        self.profileNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(11.withRatio())
            make.left.equalTo(self.profilePhoto.snp.right).offset(19.withRatio())
        }
        
        self.profileEmailLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-13.withRatio())
            make.left.equalTo(self.profilePhoto.snp.right).offset(19.withRatio())
        }
        
        self.profilePhoneLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-14.withRatio())
            make.centerY.equalTo(self.profileEmailLabel.snp.centerY)
        }
    }
    
    func display(user: UserModel) {
        self.profileNameLabel.text = user.name
        self.profileEmailLabel.text = user.email
        self.profilePhoneLabel.text = user.phone
    }
}
