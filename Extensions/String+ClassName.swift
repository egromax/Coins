//
//  String+ClassName.swift
//  Coins
//
//  Created by Maxim Egorov on 07.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last ?? ""
    }
}
