//
//  UserModel.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 20/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

class UserModel: NSObject {
    @objc let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAdressModel
    let phone: String
    let website: String
    let company: UserCompanyModel
    
    init(id: Int, name: String, username: String, email: String, address: UserAdressModel, phone: String, website: String, company: UserCompanyModel) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    static func convert(from user: UserApiResponseModel) -> UserModel {
        let adressModel = UserAdressModel.convert(from: user.address)
        let companyModel = UserCompanyModel.convert(from: user.company)
        let model = UserModel(id: user.id, name: user.name, username: user.username, email: user.email, address: adressModel, phone: user.phone, website: user.website, company: companyModel)
        return model
    }
    
    static func convert(from items: [UserApiResponseModel]) -> [UserModel] {
          var models = [UserModel]()
          items.forEach { models.append(UserModel.convert(from: $0)) }
          return models
      }
}

class UserAdressModel: NSObject {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: UserGeoModel
    
    init(street: String, suite: String, city: String, zipcode: String, geo: UserGeoModel) {
           self.street = street
           self.suite = suite
           self.city = city
           self.zipcode = zipcode
           self.geo = geo
    }
    
    static func convert(from adress: UserAdressApiResponseModel) -> UserAdressModel {
        let geoModel = UserGeoModel.convert(from: adress.geo)
        let model = UserAdressModel(street: adress.street, suite: adress.suite, city: adress.city, zipcode: adress.zipcode, geo: geoModel)
        return model
      }
}

class UserGeoModel: NSObject {
    let lat: String
    let lng: String
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    
    static func convert(from geo: UserGeoApiResponseModel) -> UserGeoModel {
        let model = UserGeoModel(lat: geo.lat, lng: geo.lng)
        return model
    }
    
}

class UserCompanyModel: NSObject {
    let name: String
    let catchPhrase: String
    let bs: String
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
    static func convert(from company: UserCompanyApiResponseModel) -> UserCompanyModel {
        let model = UserCompanyModel(name: company.name, catchPhrase: company.catchPhrase, bs: company.bs)
        return model
    }
}

