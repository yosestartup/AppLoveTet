//
//  ProfileDetailsDIResolver.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - test
protocol ProfileDetailsProtocol {
    func presentProfileDetailsViewController(user: UserModel) -> UIViewController
}

extension DIResolver: ProfileDetailsProtocol {
    func presentProfileDetailsViewController(user: UserModel) -> UIViewController {
        let viewController = ProfileDetailsViewController()
        let interactor = ProfileDetailsInteractor(networkController: self.networkController)
        let wireFrame = ProfileDetailsWireFrame(resolver: self)
        let presenter = ProfileDetailsPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor, user: user)
        viewController.presenter = presenter
        return viewController
    }
}
