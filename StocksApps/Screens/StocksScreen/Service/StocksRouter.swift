//
//  StocksRouter.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 04.05.2023.
//

import Foundation
//"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=100"
enum StocksRouter: Router {
    case stocks(currency: String, count: String)
    
    // Router содаержать несколько запросов получения самых stocks
    
    var baseUrl: String {
        "https://api.coingecko.com/"
    }
    
    var path: String {
        switch self {
        case .stocks:
            return "api/v3/coins/markets"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .stocks:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .stocks(let currency, let count):
            return ["vs_currency": currency, "per_page": count]
        }
    }
}
