//
//  ModuleBuilder.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 05.05.2023.
//

import Foundation
import UIKit

final class ModuleBuilder {
    private init() {}
    
    private lazy var network: NetworkService = {
        Network()
    }()
    
    static let shared: ModuleBuilder = .init()
    
    func networkService() -> NetworkService {
        network
    }
    
    func stocksService() -> StocksServiceProtocol {
        StocksService(client: network)
    }
    
    func stocksModule() -> UIViewController {
        let presenter = StocksPresenter(service: stocksService())
        let view = StockViewController(presenter: presenter)
        presenter.view = view
        
        return view
    }
    
    func secondVC() -> UIViewController {
        UIViewController()
    }

    func thirdVC() -> UIViewController {
        UIViewController()
    }
    func tabbarController() -> UIViewController {
        let tabbar = UITabBarController()
        
        let stocksVC = stocksModule()
        stocksVC.tabBarItem = UITabBarItem(title: "Stocks", image: nil, tag: 0)
        
        let secondVC = stocksModule()
        secondVC.tabBarItem = UITabBarItem(title: "Favourite", image: nil, tag: 0)

        let thirdVC = stocksModule()
        thirdVC.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 0)

        
        tabbar.viewControllers = [stocksVC, secondVC, thirdVC].map { UINavigationController(rootViewController: $0) }
        
        return tabbar
    }
}
