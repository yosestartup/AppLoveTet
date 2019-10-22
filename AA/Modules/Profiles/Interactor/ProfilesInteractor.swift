//
//  ProfilesInteractor.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

class ProfilesInteractor: BaseInteractor { }

extension ProfilesInteractor: ProfilesInteractorProtocol {
    func fetchUsers(completion: @escaping ([UserApiResponseModel]?, NetworkError?) -> Void) {
        self.networkController.getUsers(completion: completion)
    }
}
