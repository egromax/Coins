//
//  CryptoCurrencyCell.swift
//  Coins
//
//  Created by Maxim Egorov on 07.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import UIKit

class CryptoCurrencyCell: TableCell {
    //MARK: - IBOutlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var exchangeRateLabel: UILabel!
    @IBOutlet private weak var percentChangeLabel: UILabel!
    
    //MARK: - Overrided properties
    override class var cellIdentifier: String {
        CryptoCurrencyCell.identifier
    }
    
    //MARK: - Lifecycle
    override func updateViews() {
        guard let model = self.model as? CryptoCurrencyCellModel else { return }
        nameLabel.text = model.currencyName
        exchangeRateLabel.text = String(format: "%.5f", model.currencyExchangeRate) + " USD"
        percentChangeLabel.text = String(format: "%.5f", model.currencyPercentChange) + "%"
        percentChangeLabel.textColor = model.currencyPercentChange > 0 ? .systemGreen : .systemRed
    }
    
}
