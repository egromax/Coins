//
//  ViewController.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    //MARK: - Private properties
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: view.bounds)
        table.registerCellNib(CryptoCurrencyCell.self)
        table.dataSource = self
        table.delegate = self
        table.refreshControl = refreshControl
        table.tableFooterView = UIView(frame: .zero)
        return table
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        return refresh
    }()
    
    private var cryptoCurrencyModels: [CryptoCurrencyCellModel] = [] {
        didSet {
            RunLoop.main.perform(inModes: [.common]) {
                self.tableView.reloadData()
            }
        }
    }
    
    private let paginator: Paginator
    
    //MARK: - Inititialization
    init(paginator: Paginator) {
        self.paginator = paginator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Crypto Currencies"
        navigationController?.navigationBar.prefersLargeTitles = true
        loadNextPage()
    }
}

//MARK: - Module functions
private extension ViewController {
    func loadNextPage() {
        paginator.loadNextPage { [weak self] state in
            if case Paginator.State.pageLoaded(cryptoCurrencies: let cryptoCurrencies) = state {
                self?.cryptoCurrencyModels.append(contentsOf: cryptoCurrencies.map{CryptoCurrencyCellModel(currency: $0)})
            }
        }
    }
    
    func refreshCryptoCurrencies() {
        paginator.refresh { [weak self] state in
            if case Paginator.State.pageLoaded(cryptoCurrencies: let cryptoCurrencies) = state {
                self?.cryptoCurrencyModels = cryptoCurrencies.map{CryptoCurrencyCellModel(currency: $0)}
            }
            RunLoop.main.perform(inModes: [.default]) {
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    //MARK: - Actions
    @objc
    func refresh(_ sender: UIRefreshControl) {
        refreshCryptoCurrencies()
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoCurrencyModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cryptoCurrencyModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier, for: indexPath) as? CryptoCurrencyCell else {
            return UITableViewCell()
        }
        cell.model = model
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let targetCount = cryptoCurrencyModels.count * 3 / 4
        guard indexPath.row == targetCount else { return }
        loadNextPage()
    }
}
