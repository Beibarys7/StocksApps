//
//  AppDelegate.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 18.04.2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ModuleBuilder.shared.tabbarController()
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
    
}

//class MockService: StocksServiceProtocol {
//    func getStocks(currency: String, count: String, completion: @escaping (Result<[Stock], NetworkError>) -> Void) {
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            completion(.failure(.taskError))
//        }
//
//    }
//}

