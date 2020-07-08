//
//  TableSectionModel.swift
//  NoviNexus
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import UIKit

protocol TableSectionIdentifiable {
    var headerIdentifier: String { get }
    var headerHeight: CGFloat { get }
    var rows: [TableCellIdentifiable] { get set }
}

open class TableSectionModel: TableSectionIdentifiable {
    var footerHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    var rows: [TableCellIdentifiable]
    
    var headerIdentifier: String {
        return ""
    }
    
    var headerHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    init() {
        self.rows = []
    }
    
    
}
