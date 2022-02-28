//
//  CodableExtension.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

public extension Encodable {

    func toJSONData(with encoder: JSONEncoder? = nil) -> Data? {
        let encoder = encoder ?? JSONEncoder()
        return try? encoder.encode(self)
    }

    func toJSON(with encoder: JSONEncoder? = nil) -> [String: Any]? {
        guard let data = self.toJSONData(with: encoder),
            let res = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return nil
        }
        return res as? [String: Any]
    }

    func toJSONString(encoding: String.Encoding = .utf8, with encoder: JSONEncoder? = nil) -> String? {
        guard let data = self.toJSONData(with: encoder) else {
            return nil
        }
        return String(data: data, encoding: encoding)
    }

}

public extension Decodable {

    public static func fromJSON(data: Data, with decoder: JSONDecoder? = nil) -> Self? {
        let decoder = decoder ?? JSONDecoder()
        return try? decoder.decode(Self.self, from: data)
    }

    public static func fromJSONString(string: String, encoding: String.Encoding = .utf8, with decoder: JSONDecoder? = nil) -> Self? {
        let data = string.data(using: encoding)!
        return Self.fromJSON(data: data, with: decoder)
    }

}
