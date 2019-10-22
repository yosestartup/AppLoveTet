//
//  ProfilesDIResolver.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - test
protocol ProfilesProtocol {
    func presentProfilesViewController() -> UIViewController
}

extension DIResolver: ProfilesProtocol {
    func presentProfilesViewController() -> UIViewController {
        let viewController = ProfilesViewController()
        let interactor = ProfilesInteractor(networkController: self.networkController)
        let wireFrame = ProfilesWireFrame(resolver: self)
        let presenter = ProfilesPresenter(view: viewController, wireFrame: wireFrame, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
