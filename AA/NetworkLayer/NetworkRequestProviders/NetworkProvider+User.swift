//
//  NetworkProvider+User.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import UIKit

extension NetworkRequestProvider: NetworkUserRequestProtocol {
    func getUsers(completion: @escaping ([UserApiResponseModel]?, NetworkError?) -> Void) {
        let request = UsersApiRequest.init()
        self.runRequest(request) { (_, data, error) in
            let jsonDecoder = JSONDecoder()
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else {
                let error = NetworkErrorStruct(statusCode: nil, data: nil)
                    completion(nil, error)
                    return
                }
            do {
                let models = try jsonDecoder.decode([UserApiResponseModel].self, from: data)
                completion(models, nil)
            } catch {
                let error = NetworkErrorStruct(error: error as NSError)
                completion(nil, error)
            }
        }
    }
    
    func getUserPosts(userId: String, completion: @escaping ([PostApiResponseModel]?, NetworkError?) -> Void) {
           let request = PostsApiRequest.init(userId: userId)
             self.runRequest(request) { (_, data, error) in
                 let jsonDecoder = JSONDecoder()
                 if let error = error {
                     completion(nil, error)
                     return
                 }
                 guard let data = data else {
                     let error = NetworkErrorStruct(statusCode: nil, data: nil)
                         completion(nil, error)
                         return
                     }
                 do {
                     let models = try jsonDecoder.decode([PostApiResponseModel].self, from: data)
                     completion(models, nil)
                    print(models[0].title)
                 } catch {
                     let error = NetworkErrorStruct(error: error as NSError)
                     completion(nil, error)
                 }
             }
        
    }

}

