//
//  UserApiResponseModel.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

struct UserApiResponseModel: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAdressApiResponseModel
    let phone: String
    let website: String
    let company: UserCompanyApiResponseModel
}

struct UserAdressApiResponseModel: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: UserGeoApiResponseModel
}

struct UserGeoApiResponseModel: Codable {
    let lat: String
    let lng: String
}

struct UserCompanyApiResponseModel: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}
