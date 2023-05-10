//
//  NetworkError.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 20.04.2023.
//

import Foundation

enum NetworkError: String, Error {
    case missingURL
    case missingRequest
    case taskError
    case responseError
    case dataError
    case decodeError
}
