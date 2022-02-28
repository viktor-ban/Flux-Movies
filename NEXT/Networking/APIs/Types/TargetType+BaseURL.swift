//
//  TargetType+BaseURL.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 03/05/16.
//  Copyright © 2016 Domonkos Pal. All rights reserved.
//

import Foundation
import Moya

extension TargetType {

    var baseURL: URL {
        return URL(string: Config.environment.baseURL)!
    }

}
