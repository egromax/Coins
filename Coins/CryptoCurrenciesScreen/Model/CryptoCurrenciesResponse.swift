//
//  CryptoCurrencyResponse.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

struct CryptoCurrenciesResponse {
    let data: [CryptoCurrency]
}

extension CryptoCurrenciesResponse: Decodable {}
