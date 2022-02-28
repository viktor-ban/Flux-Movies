//
//  SessionManager.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 12/05/16.
//  Copyright © 2016 Domonkos Pal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

/**
 # SessioningManager
 Handle process and state of user's session (authentication).
 */
protocol SessioningManager {

}

class SessionManager: SessioningManager {

    fileprivate var _networkDataManager: NetworkingDataManager
    fileprivate var _networkManager: NetworkingManager

    // MARK: - Constructor

    init(networkManager: NetworkingManager, networkDataManager: NetworkingDataManager) {
        _networkManager = networkManager
        _networkDataManager = networkDataManager
    }

}
