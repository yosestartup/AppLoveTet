//
//  PostApiResponseModel.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct PostApiResponseModel: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

