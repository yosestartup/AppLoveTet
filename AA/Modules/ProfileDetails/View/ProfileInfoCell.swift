//
//  ProfileInfoCell.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class ProfileInfoCell: UITableViewCell {
    
    private var adressLabel: UILabel = UILabel()
    private var adressValueLabel: UILabel = UILabel()
    
    private var companyLabel: UILabel = UILabel()
    private var companyValueLabel: UILabel = UILabel()
    
    private var webSiteLabel: UILabel = UILabel()
    private var webSiteValueLabel: UILabel = UILabel()
    
    private var activityLabel: UILabel = UILabel()
    
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
        
        container.addSubview(adressLabel)
        container.addSubview(adressValueLabel)
        container.addSubview(companyLabel)
        container.addSubview(companyValueLabel)
        container.addSubview(webSiteLabel)
        container.addSubview(webSiteValueLabel)
        container.addSubview(activityLabel)
        
        self.contentView.addSubview(container)
 
        self.adressLabel.textColor = UIColor.black
        self.adressLabel.font = UIFont(name: "Raleway-Semibold", size: 14.0)
        self.adressLabel.text = "Adres"
        self.adressValueLabel.textColor = Colors.textGrey
        self.adressValueLabel.font = UIFont(name: "Raleway-Regular", size: 14.0)
    
        self.companyLabel.textColor = UIColor.black
        self.companyLabel.font = UIFont(name: "Raleway-Semibold", size: 14.0)
        self.companyLabel.text = "Firma"
        self.companyValueLabel.textColor = Colors.textGrey
        self.companyValueLabel.font = UIFont(name: "Raleway-Regular", size: 14.0)
        
        self.webSiteLabel.textColor = UIColor.black
        self.webSiteLabel.font = UIFont(name: "Raleway-Semibold", size: 14.0)
        self.webSiteLabel.text = "Strona"
        self.webSiteValueLabel.textColor = Colors.textGrey
        self.webSiteValueLabel.font = UIFont(name: "Raleway-Regular", size: 14.0)
        
        self.activityLabel.textColor = UIColor.black
        self.activityLabel.font = UIFont(name: "Raleway-Semibold", size: 14.0)
        self.activityLabel.text = "Aktywność"
        
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.adressLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(38.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
        }
        
        self.adressValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(adressLabel.snp.bottom).offset(6.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
            make.right.equalToSuperview().offset(-25.withRatio())
        }
        
        self.companyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(adressValueLabel.snp.bottom).offset(14.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
        }
        
         self.companyValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(companyLabel.snp.bottom).offset(6.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
            make.right.equalToSuperview().offset(-25.withRatio())
        }
        
        self.webSiteLabel.snp.makeConstraints { (make) in
            make.top.equalTo(companyValueLabel.snp.bottom).offset(14.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
        }
        
         self.webSiteValueLabel.snp.makeConstraints { (make) in
            make.top.equalTo(webSiteLabel.snp.bottom).offset(6.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
            make.right.equalToSuperview().offset(-25.withRatio())
        }
        
        self.activityLabel.snp.makeConstraints { (make) in
            make.top.equalTo(webSiteValueLabel.snp.bottom).offset(20.withRatio())
            make.left.equalToSuperview().offset(25.withRatio())
            make.bottom.equalToSuperview().offset(-16.withRatio())
        }
       
    }
    
    func display(user: UserModel) {
        let adressString = user.address.street + ", " +
        user.address.zipcode + " " + user.address.city
        self.adressValueLabel.text = adressString
        self.companyValueLabel.text = user.company.name + " , " + adressString
        self.webSiteValueLabel.text = user.website
    }
}
