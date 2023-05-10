//
//  StackCell.swift
//  StocksApps
//
//  Created by Beibarys Shagay on 18.04.2023.
//

import UIKit

final class StackCell: UITableViewCell {
    
    private lazy var iconView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "YNDX")
        image.layer.cornerRadius = 12
        image.backgroundColor = .cyan
        return image
    }()
    
    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "YNDX"
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Yandex, LCC"
        label.font = label.font.withSize(10)
        return label
    }()
    
    private lazy var currentPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "4 764,6₽"
        return label
    }()
    
    private lazy var currentChange24hLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+55 ₽ (1,15%)"
        label.textColor = .systemGreen
        label.font = label.font.withSize(10)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(iconView)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(currentPriceLabel)
        contentView.addSubview(currentChange24hLabel)
        
        setupConstraints()
    }
    
    func configure(with model: StockModelProtocol) {
        symbolLabel.text = model.symbol
        nameLabel.text = model.name
        currentPriceLabel.text = "\(model.price)"
    }
    
    private func setupConstraints() {
        
        iconView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 52).isActive = true
        iconView.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        symbolLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12).isActive = true
        symbolLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
   
        nameLabel.topAnchor.constraint(equalTo: symbolLabel.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 8).isActive = true
        
        currentPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true
        currentPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34).isActive = true
        
        currentChange24hLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -34).isActive = true
        currentChange24hLabel.topAnchor.constraint(equalTo: currentPriceLabel.topAnchor, constant: 20).isActive = true
    }
    
}

