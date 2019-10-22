//
//  ProfilesProtocols.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

protocol ProfilesViewProtocol: class {
    func insertUsers(users: [UserModel])
    func showLoading(message: String?)
    func hideLoading()
    func showOkAlertController(title: String?, message: String?, callback: (() -> Void)?)
}

protocol ProfilesWireFrameProtocol: class {
    func presentProfileDetail(from: ProfilesViewProtocol?, user: UserModel)
}

protocol ProfilesPresenterProtocol: class {
     func fetchUsers()
     func didClick(user: UserModel)
}

protocol ProfilesInteractorProtocol: class {
    func fetchUsers(completion: @escaping ([UserApiResponseModel]?, NetworkError?) -> Void) 
}

