//
//  AppConfiguration.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    static var serverUrl: String {
       guard let serverUrl = Bundle.main.infoDictionary?["ServerUrl"] as? String else {
           return ""
       }
       
       return serverUrl
    }
    
    static var apiKey: String {
        guard let serverUrl = Bundle.main.infoDictionary?["ApiKey"] as? String else {
            return ""
        }
        
        return serverUrl
    }
}
