//
//  UIView+Identifier.swift
//  Coins
//
//  Created by Maxim Egorov on 07.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation
import class UIKit.UIView

extension UIView {
    class var identifier: String {
        return String.className(self)
    }
}
