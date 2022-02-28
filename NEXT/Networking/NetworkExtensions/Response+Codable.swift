//
//  Response+Codable.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 02/05/16.
//  Copyright © 2016 Domonkos Pal. All rights reserved.
//

import Foundation
import Moya

public extension Response {

    public func map<T: Codable>(with decoder: JSONDecoder? = nil, failsOnEmptyData: Bool = false) throws -> T {
        let decoder = decoder ?? JSONDecoder()
        guard let object = try? decoder.decode(T.self, from: self.data) else {
            throw Moya.MoyaError.jsonMapping(self)
        }
        
        return object
    }

}
