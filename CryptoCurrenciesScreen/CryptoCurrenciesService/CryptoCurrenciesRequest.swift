//
//  CurrenciesRequest.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

struct CryptoCurrenciesRequest: Request {
    //MARK: - Properties
    let start: Int
    let limit: Int
    
    //MARK: - Request implementation
    var path: String = "cryptocurrency/listings/latest"
    var method: HTTPMethod = .get
    var parameters: RequestParameters {
        return .url(["limit": limit, "start": start])
    }
    var headers: [String : String] {
        ["X-CMC_PRO_API_KEY": AppConfiguration.apiKey]
    }
    
}
