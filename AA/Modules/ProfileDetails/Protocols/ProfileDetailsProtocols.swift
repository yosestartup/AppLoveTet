//
//  ProfileDetailsProtocols.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol ProfileDetailsViewProtocol: class {
   func insertPosts(posts: [PostModel])
   func showLoading(message: String?)
   func hideLoading()
   func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
}

protocol ProfileDetailsWireFrameProtocol: class { }

protocol ProfileDetailsPresenterProtocol: class {
    func getUserModel() -> UserModel
    func fetchPosts()
}

protocol ProfileDetailsInteractorProtocol: class {
     func fetchPosts(userId: String, completion: @escaping ([PostApiResponseModel]?, NetworkError?) -> Void)
}

