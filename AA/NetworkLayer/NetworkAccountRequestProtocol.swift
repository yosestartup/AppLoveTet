//
//  NetworkAccountRequestProtocol.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

protocol NetworkUserRequestProtocol {
    func getUsers(completion: @escaping([UserApiResponseModel]?, NetworkError?) -> Void)
    func getUserPosts(userId: String, completion: @escaping ([PostApiResponseModel]?, NetworkError?) -> Void)
}
