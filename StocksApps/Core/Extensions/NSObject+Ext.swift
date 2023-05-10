//
//  NSObject+Ext.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 04.05.2023.
//

import Foundation
extension NSObject {
    static var typeName: String {
        String(describing: self)
    }
}
