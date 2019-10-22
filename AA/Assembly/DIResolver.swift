//
//  ProfilesDIResolver.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

// MARK: - DIResolver
class DIResolver {

    let networkController: NetworkRequestProvider

    // MARK: - Init
    init(networkController: NetworkRequestProvider) {
        self.networkController = networkController
    }

}
