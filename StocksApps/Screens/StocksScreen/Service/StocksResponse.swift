//
//  StocksResponse.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 05.05.2023.
//

import Foundation

// распарсим данные здесь
struct Stock: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let price: Double
    let change: Double
    let percentage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case price = "current_price"
        case change = "price_change_24h"
        case percentage = "price_change_percentage_24h"
    }
}
