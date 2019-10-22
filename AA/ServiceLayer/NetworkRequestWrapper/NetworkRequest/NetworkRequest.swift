//
//  NetworkRequest.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

enum RequestHTTPMethod {
    case get
}

protocol NetworkRequest {
    var path: String { get }
    var method: RequestHTTPMethod { get }
    var params: [String: Any] { get }
}

