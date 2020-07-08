//
//  CryptoCurrencyCellModel.swift
//  Coins
//
//  Created by Maxim Egorov on 07.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

final class CryptoCurrencyCellModel: TableCellModel {
    //MARK: - Overrided properties
    override var cellIdentifier: String {
        CryptoCurrencyCell.cellIdentifier
    }
    
    //MARK: - Propperties
    let currencyName: String
    let currencyExchangeRate: Double
    let currencyPercentChange: Float
    
    //MARK: - Initialization
    init(currency: CryptoCurrency) {
        self.currencyName = currency.name
        self.currencyExchangeRate = currency.quote.usd.price
        self.currencyPercentChange = currency.quote.usd.percentChange
    }
}
