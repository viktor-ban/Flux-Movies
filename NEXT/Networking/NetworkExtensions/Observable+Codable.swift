//
//  Observable+Decodable.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 02/05/16.
//  Copyright © 2016 Domonkos Pal. All rights reserved.
//

import Foundation
import RxSwift
import Moya


public extension ObservableType where Element == Response {

    // TODO: check thread

    func map<T: Codable>(_ type: T.Type, with decoder: JSONDecoder? = nil, failsOnEmptyData: Bool = false) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(try response.map(with: decoder, failsOnEmptyData: failsOnEmptyData))
                .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
                .observeOn(MainScheduler.instance)
        }
    }

}
