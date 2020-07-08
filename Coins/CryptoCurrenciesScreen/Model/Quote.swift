//
//  Quote.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

struct Quote {
    let usd: Usd
}

extension Quote: Decodable {
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
