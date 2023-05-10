//
//  ViewController.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 18.04.2023.
//

import UIKit

class StockViewController: UIViewController {
    
    private let presenter: StocksPresenterProtocol
    
    init(presenter: StocksPresenterProtocol) {
       self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
   }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.register(StackCell.self, forCellReuseIdentifier: StackCell.typeName)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSubViews()
        
        presenter.loadView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Stocks"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
//    Написать сетевой слой что бы любые запросы добавлять лдя любых экранов
    private func setupSubViews() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
   
}

extension StockViewController: StocksViewProtocol {
    func updateView() {
        tableView.reloadData()
    }
    
    func updateView(withLoader isLoder: Bool) {
        print("Loader is - ", isLoder, " at ", Date())
    }
    
    func updateView(withError message: String) {
        print("Error - ", message)
    }
    
    
}

extension StockViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StackCell.typeName, for: indexPath) as! StackCell
        cell.configure(with: presenter.model(for: indexPath))
        return cell
    }
    
    
}


//{
//    "id":"bitcoin",
//    "symbol":"btc",
//    "name":"Bitcoin",
//    "image":"https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
//    "current_price":29543,
//    "market_cap":581837069179,
//    "market_cap_rank":1,
//    "fully_diluted_valuation":631433950901,
//    "total_volume":18625139843,
//    "high_24h":30443,
//    "low_24h":29550,
//    "price_change_24h":-234.22706533227392,
//    "price_change_percentage_24h":-0.78659,
//    "market_cap_change_24h":5256252455,
//    "market_cap_change_percentage_24h":0.91162,
//    "circulating_supply":19350525.0,
//    "total_supply":21000000.0,
//    "max_supply":21000000.0,
//    "ath":69045,
//    "ath_change_percentage":-56.41711,
//    "ath_date":"2021-11-10T14:24:11.849Z",
//    "atl":67.81,
//    "atl_change_percentage":44277.15212,
//    "atl_date":"2013-07-06T00:00:00.000Z",
//    "roi":null,
//    "last_updated":"2023-04-19T08:18:44.598Z"
// },
