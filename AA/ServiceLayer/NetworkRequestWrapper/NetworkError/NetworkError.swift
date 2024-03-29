//
//  NetworkError.swift
//  ApploverTestTask
//
//  Created by Oleksandr Bambulyak on 19/10/2019.
//  Copyright © 2019 Oleksandr Bambulyak. All rights reserved.
//

import Foundation

enum NetworkErrorType: Equatable {
    case noConnection
    case lostConnection
    case internalServerError
    case badRequest
    case cancelled
    case timedOut
    case notFound
    case forbidden
    case unspecified(statusCode: Int)
}

protocol NetworkError: Error {
    var statusCode: Int { get }
    var type: NetworkErrorType { get }
    var errorCode: Int? { get }
    var description: String? { get }
    var message: String? { get }
    var plainBody: String? { get }
    var detailMessage: String? { get }
}

struct NetworkErrorStruct: NetworkError {

    var statusCode: Int = 0
    var type: NetworkErrorType = .unspecified(statusCode: 0)
    var errorCode: Int?
    var description: String?
    var message: String?
    var plainBody: String?
    var detailMessage: String?

    init(statusCode: Int?, data: Data?) {
        guard let statusCode = statusCode else {
            return
        }

        self.statusCode = statusCode
        self.errorCode = statusCode
        self.setNetworkErrorType(from: statusCode)
    }

    init(error: NSError) {
        self.description = error.localizedDescription
    }

    private mutating func setNetworkErrorType(from statusCode: Int) {
        var networkErrorType: NetworkErrorType

        switch statusCode {
        case URLError.notConnectedToInternet.rawValue, URLError.cannotFindHost.rawValue, URLError.cannotConnectToHost.rawValue:
            networkErrorType = .noConnection
        case URLError.timedOut.rawValue:
            networkErrorType = .timedOut
        case URLError.networkConnectionLost.rawValue:
            networkErrorType = .lostConnection
        case 400:
            networkErrorType = .badRequest
        case 404:
            networkErrorType = .notFound
        case 403:
            networkErrorType = .forbidden
        case 500...599:
            networkErrorType = .internalServerError
        default:
            networkErrorType = .unspecified(statusCode: statusCode)
        }

        self.type = networkErrorType
    }
}
