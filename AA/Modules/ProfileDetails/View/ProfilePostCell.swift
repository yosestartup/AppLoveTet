//
//  ProfilePostCell.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit
import SnapKit

class ProfilePostCell: UITableViewCell {
    private var postImageView: UIImageView = UIImageView()
    private var postTitleLabel: UILabel = UILabel()
    private var postContentTextLabel: UILabel = UILabel()
    
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
        
        container.addSubview(postImageView)
        container.addSubview(postTitleLabel)
        container.addSubview(postContentTextLabel)
        
        self.contentView.addSubview(container)
        
        self.postImageView.contentMode = .scaleAspectFill
        self.postImageView.layer.cornerRadius = 7
        self.postImageView.layer.masksToBounds = true
        self.postImageView.image = UIImage(named: "test")
        
        self.postTitleLabel.textColor = UIColor.black
        self.postTitleLabel.numberOfLines = 1
        self.postTitleLabel.font = UIFont(name: "Raleway-SemiBold", size: 14.0)
        
        self.postContentTextLabel.textColor = Colors.textGrey
        self.postContentTextLabel.numberOfLines = 3
        self.postContentTextLabel.font = UIFont(name: "Raleway-Regular", size: 12.0)
        
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.postImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25.withRatio())
            make.width.height.equalTo(81.withRatio())
            make.bottom.equalToSuperview().offset(-16.withRatio())
        }
        
        self.postTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.top)
            make.right.equalToSuperview().offset(-21.withRatio())
            make.left.equalTo(self.postImageView.snp.right).offset(12.withRatio())
        }
        
        self.postContentTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(postTitleLabel.snp.bottom).offset(7.withRatio())
            make.right.equalToSuperview().offset(-21.withRatio())
            make.left.equalTo(self.postImageView.snp.right).offset(12.withRatio())
        }
    }
    
    func display(post: PostModel) {
        self.postTitleLabel.text = post.title
        self.postContentTextLabel.text = post.body
    }
}

