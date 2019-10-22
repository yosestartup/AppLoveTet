//
//  BaseInteractor.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

class BaseInteractor {

    var networkController: NetworkRequestProvider! = nil

    init(networkController: NetworkRequestProvider) {
        self.networkController = networkController
    }
}
