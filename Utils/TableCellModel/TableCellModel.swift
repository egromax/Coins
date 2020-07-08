//
//  TableCellModel.swift
//  NoviNexus
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import UIKit

public protocol TableCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
}

open class TableCellModel: TableCellIdentifiable {
    
    // MARK: - Props
    public var cellIdentifier: String {
        return ""
    }
    
    public var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    // MARK: - Initialization
    init() { }
    
}
