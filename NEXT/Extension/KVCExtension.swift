//
//  KVCExtension.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

//source: https://github.com/leemorgan/Swift-KVC/blob/master/KVC%20Playground.playground/Contents.swift

import Foundation

// swiftlint:disable line_length

/// KeyValueCodable - Defines a mechanism by which you can access the properties of an object indirectly by name (or key), rather than directly through invocation of an accessor method or as instance variables.
protocol KeyValueCodable {

    func valueForKey<T>(key: String) -> T?

    subscript (key: String) -> Any? { get }
}

extension KeyValueCodable {

    /// Returns the value for the property identified by a given key.
    func valueForKey<T>(key: String) -> T? {
        let mirror = Mirror.init(reflecting: self)

        for child in mirror.children where child.label == key {
            return child.value as? T
        }
        return nil
    }

    /// Returns the value for the property identified by a given key.
    subscript (key: String) -> Any? {
        get {
            return self.valueForKey(key: key)
        }
    }
}
