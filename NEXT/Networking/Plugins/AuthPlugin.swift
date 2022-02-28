//
//  AuthPlugin.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 2017. 08. 11..
//  Copyright © 2017. Domonkos Pal. All rights reserved.
//

import Foundation
import Moya

struct AuthPlugin: PluginType {

    fileprivate var _networkConfig: NetworkingConfig
    fileprivate var _networkDataManager: NetworkingDataManager

    // MARK: - Constructor

    init(networkConfig: NetworkingConfig, networkDataManager: NetworkingDataManager) {
        _networkConfig = networkConfig
        _networkDataManager = networkDataManager
    }

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard
            let multiTarget = target as? MultiTarget,
            case let .target(target) = multiTarget,
            let authTarget = target as? BaseTargetType
        else {
            return request
        }

        var request = request
        if authTarget.addAuthHeader {
            //request.addValue(_networkConfig.authHeaderType + " " + token, forHTTPHeaderField: _networkConfig.authHeaderName)
        }

        return request
    }
}
