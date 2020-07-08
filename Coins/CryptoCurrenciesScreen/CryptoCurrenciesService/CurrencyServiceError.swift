//
//  CurrencyServiceError.swift
//  Coins
//
//  Created by Maxim Egorov on 08.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

enum CurrencyServiceError: Error {
    case parsingError
    case dataError
    case accessError
    case internalServerError
}

extension CurrencyServiceError: LocalizedError {
    var errorDescription: String? {
        "Something went wrong, we will fix it as soon as possible!"
    }
}
