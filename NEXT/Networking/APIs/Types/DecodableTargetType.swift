//
//  DecodableTargetType.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 2017. 08. 25..
//  Copyright © 2017. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
import Moya

protocol DecodableTargetType {
    associatedtype ResultType: Codable
}
