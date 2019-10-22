//
//  ProfileDetailsInteractor.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

class ProfileDetailsInteractor: BaseInteractor { }

extension ProfileDetailsInteractor: ProfileDetailsInteractorProtocol {
    func fetchPosts(userId: String, completion: @escaping ([PostApiResponseModel]?, NetworkError?) -> Void) {
        self.networkController.getUserPosts(userId: userId, completion: completion)
    }
}
