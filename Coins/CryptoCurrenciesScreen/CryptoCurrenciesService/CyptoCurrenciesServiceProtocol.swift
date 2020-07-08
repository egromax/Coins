//
//  CyptoCurrenciesServiceProtocol.swift
//  Coins
//
//  Created by Maxim Egorov on 08.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

typealias CryptoCurrenciesCompletion = (Result<[CryptoCurrency], Error>) -> Void

protocol CryptoCurrenciesServiceProtocol: class {
    func getCryptoCurrencies(start: Start, limit: Limit, completion: @escaping CryptoCurrenciesCompletion)
    func cancelLoadCryptocurrencies()
}
