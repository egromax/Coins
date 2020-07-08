//
//  CyptoCurrenciesService.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

final class CryptoCurrenciesService: CryptoCurrenciesServiceProtocol {
    //MARK: - Private properties
    private let networkDispatcher: Dispatcher
    private var currentTask: Cancellable?
    
    //MARK: - Initialization
    init(networkDispatcher: Dispatcher) {
        self.networkDispatcher = networkDispatcher
    }
    
    
    //MARK: - CryptoCurrenciesServiceProtocol
    func getCryptoCurrencies(start: Start, limit: Limit, completion: @escaping CryptoCurrenciesCompletion) {
        let request = CryptoCurrenciesRequest(start: start, limit: limit)
        currentTask = networkDispatcher.execute(request: request) { [weak self] result in
            defer {
                self?.currentTask = nil
            }
            switch result {
            case .success(let response):
                if response.statusCode >= 400 && response.statusCode <= 499 {
                    completion(Result.failure(CurrencyServiceError.accessError))
                    return
                }
                
                if response.statusCode >= 500 && response.statusCode <= 599 {
                    completion(Result.failure(CurrencyServiceError.internalServerError))
                    return
                }
                
                if response.statusCode >= 200 && response.statusCode <= 299 {
                    guard let cryptoCurrenciesResponse = try? JSONDecoder().decode(CryptoCurrenciesResponse.self, from: response.data) else {
                        completion(Result.failure(CurrencyServiceError.parsingError))
                        return
                    }
                    completion(Result.success(cryptoCurrenciesResponse.data))
                }
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func cancelLoadCryptocurrencies() {
        currentTask?.cancel()
    }
}
