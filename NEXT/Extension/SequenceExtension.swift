//
//  SequenceExtension.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
public extension Sequence {
    /// Source: http://stackoverflow.com/questions/31220002/how-to-group-by-the-elements-of-an-array-in-swift
    /// Categorises elements of self into a dictionary, with the keys given by keyFunc
    func categorise<U: Hashable>(_ key: (Iterator.Element) -> U) -> [U: [Iterator.Element]] {
        var dict: [U: [Iterator.Element]] = [:]
        for el in self {
            let key = key(el)
            if case nil = dict[key]?.append(el) { dict[key] = [el] }
        }
        return dict
    }
}
