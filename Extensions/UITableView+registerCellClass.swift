//
//  UITableView+registerCellClass.swift
//  Coins
//
//  Created by Maxim Egorov on 07.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation
import class UIKit.UITableView
import class UIKit.UINib

extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        
        register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        register(nib, forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        
        register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
}
