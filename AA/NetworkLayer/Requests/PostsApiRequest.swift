//
//  PostsApiRequest.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//


import Foundation

struct PostsApiRequest: NetworkRequest {
    
    var userId: String
    
    var path: String { return "/posts/" }
    
    var method: RequestHTTPMethod {
        return .get
    }
    
    var params: [String: Any] {
        return ["userId":userId]
    }
}
