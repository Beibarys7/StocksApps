//
//  StocksPresenter.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 04.05.2023.
//

import Foundation

protocol StocksViewProtocol: AnyObject { // AnyObject что бы реализовать ссылочный тип
    func updateView()
    func updateView(withLoader isLoder: Bool)
    func updateView(withError message: String)

}

protocol StocksPresenterProtocol { // передаем какие то моменти на Виюшек
    var view: StocksViewProtocol? { get set }
    var itemsCount: Int { get }
    
    func loadView()
    func model(for indexPath: IndexPath) -> StockModelProtocol
}

final class StocksPresenter: StocksPresenterProtocol {
    
    init(service: StocksServiceProtocol) {
        self.service = service
    }
    
    private let service: StocksServiceProtocol
    
    weak var view: StocksViewProtocol?
    private var stocks: [StockModelProtocol] = []
    
    var itemsCount: Int {
        return stocks.count
    }
    
    func loadView() {
        view?.updateView(withLoader: true)
         
        service.getStocks { result in
            self.view?.updateView(withLoader: false)
            switch result {
            case .success(let stocks):
                self.stocks = stocks.map { StockModel (stock: $0) }
                self.view?.updateView()
            case .failure(let error):
                self.view?.updateView(withError: error.localizedDescription)
            }
        }
    }
    
    func model(for indexPath: IndexPath) -> StockModelProtocol {
        stocks[indexPath.row]
    }
    
   
}
