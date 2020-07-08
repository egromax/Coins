//
//  Quote.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

struct Usd {
    let price: Double
    let percentChange: Float
}

extension Usd: Decodable {
    enum CodingKeys: String, CodingKey {
        case price
        case percentChange = "percent_change_1h"
    }
}
