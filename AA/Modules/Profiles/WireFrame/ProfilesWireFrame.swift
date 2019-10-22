//
//  ProfilesWireFrame.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class ProfilesWireFrame: BaseWireFrame, ProfilesWireFrameProtocol {
    func presentProfileDetail(from view: ProfilesViewProtocol?, user: UserModel) {
        guard let fromView = view as? UIViewController else { return }
        let viewController = self.resolver.presentProfileDetailsViewController(user: user)
        fromView.navigationController?.pushViewController(viewController, animated: true)
    }
}
