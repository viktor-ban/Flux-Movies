//
//  NetworkConfig.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 2017. 08. 11..
//  Copyright © 2017. Domonkos Pal. All rights reserved.
//

import Foundation

/**
 # NetworkingConfig
   Network communication specific configuration.
 */
protocol NetworkingConfig {
    var authHeaderName: String {get}
    var authHeaderType: String {get}

    var cachePolicy: NSURLRequest.CachePolicy {get}

    var timeoutIntervalForRequest: TimeInterval {get}
    var timeoutIntervalForResource: TimeInterval {get}

    var stubEnabled: Bool {get}
    var stubDelay: TimeInterval {get}
}

struct NetworkConfig: NetworkingConfig {
    let authHeaderName = "Authorization"
    let authHeaderType = "JWT"

    #if DEBUG
        let cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
    #else
        let cachePolicy = NSURLRequest.CachePolicy.useProtocolCachePolicy
    #endif

    let timeoutIntervalForRequest: TimeInterval = 5
    let timeoutIntervalForResource: TimeInterval = 15

    let stubEnabled = true
    let stubDelay: TimeInterval = 2
}
