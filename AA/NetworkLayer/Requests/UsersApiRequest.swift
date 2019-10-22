//
//  UsersApiRequest.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct UsersApiRequest: NetworkRequest {
    
    var path: String { return "/users/" }
    
    var method: RequestHTTPMethod {
        return .get
    }
    
    var params: [String: Any] {
        return [:]
    }
    
}
