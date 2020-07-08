//
//  Paginator.swift
//  Coins
//
//  Created by Maxim Egorov on 07.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

typealias LoadCompletion = (Start, Limit, @escaping CryptoCurrenciesCompletion) -> ()
typealias PaginatorCompletion = (Paginator.State) -> ()
typealias Start = Int
typealias Limit = Int

final class Paginator {
    //MARK: - Private properties
    private let loadCompletion: LoadCompletion
    private let cancelCompletion: () -> ()
    
    private var start: Int = 1
    private let limit: Int = 30
    
    private var currentState: State = .empty
    
    enum State {
        case empty
        case loading
        case pageLoaded(cryptoCurrencies: [CryptoCurrency])
        case allPagesLoaded
        case error(error: Error)
    }
    
    //MARK: - Initialization
    init(loadCompletion: @escaping LoadCompletion, cancelCompletion: @escaping () -> ()) {
        self.loadCompletion = loadCompletion
        self.cancelCompletion = cancelCompletion
    }
    
    //MARK: - Module functions
    func loadNextPage(completion: @escaping PaginatorCompletion) {
        if case .allPagesLoaded = currentState {
            return
        }
        if case .loading = currentState {
            return
        }
        currentState = .loading
        loadCompletion(start, limit) { result in
            switch result {
            case .success(let cryptoCurrencies):
                self.currentState = .pageLoaded(cryptoCurrencies: cryptoCurrencies)
                completion(self.currentState)
                if cryptoCurrencies.count < self.limit {
                    self.currentState = .allPagesLoaded
                    return
                }
                self.start += self.limit
            case .failure(let error):
                self.currentState = .error(error: error)
                completion(self.currentState)
                break
            }
        }
    }
    
    func refresh(completion: @escaping PaginatorCompletion) {
        clear()
        loadNextPage(completion: completion)
    }
    
    func clear() {
        if case .loading = currentState {
            cancelCompletion()
        }
        currentState = .empty
        start = 1
    }
}
