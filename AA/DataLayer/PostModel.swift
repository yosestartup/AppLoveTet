//
//  PostModel.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class PostModel: NSObject {
    let userId: Int
    @objc let id: Int
    let title: String
    let body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
    
    static func convert(from post: PostApiResponseModel) -> PostModel {
        let model = PostModel(userId: post.userId, id: post.id, title: post.title, body: post.body)
        return model
    }
    
    static func convert(from items: [PostApiResponseModel]) -> [PostModel] {
          var models = [PostModel]()
          items.forEach { models.append(PostModel.convert(from: $0)) }
          return models
      }
}
