//
//  MultiMoyaProvider.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 2017. 08. 24..
//  Copyright © 2017. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
import Moya
import RxSwift

public class MultiMoyaProvider: MoyaProvider<MultiTarget> {

    typealias Target = MultiTarget

    override public init(endpointClosure: @escaping EndpointClosure = MoyaProvider.defaultEndpointMapping,
                         requestClosure: @escaping RequestClosure = MultiMoyaProvider.defaultRequestMapping,
                         stubClosure: @escaping StubClosure = MoyaProvider.neverStub,
                         callbackQueue: DispatchQueue? = nil,
                         session: Session,
                         plugins: [PluginType] = [],
                         trackInflights: Bool = false) {
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: callbackQueue, session: session, plugins: plugins, trackInflights: trackInflights)
    }

}

public extension Reactive where Base: MultiMoyaProvider {

    func requestDefault<T: TargetType>(_ target: T, callbackQueue: DispatchQueue? = nil) -> Observable<Response> {
        return base.rx.request(MultiTarget(target), callbackQueue: callbackQueue)
            .asObservable()
            .filterSuccessfulStatusCodes()
    }

    internal func requestDecoded<T>(_ target: T, callbackQueue: DispatchQueue? = nil) -> Single<T.ResultType> where T: TargetType, T: DecodableTargetType {
        return requestDefault(target, callbackQueue: callbackQueue)
            .map(T.ResultType.self)
            .handleErrorGlobalMapped()
            .asSingle()
    }

    internal func requestMapped<T, M>(_ target: T, callbackQueue: DispatchQueue? = nil) -> Single<M> where T: TargetType, M: Codable {
        return requestDefault(target, callbackQueue: callbackQueue)
            .map(M.self)
            .handleErrorGlobalMapped()
            .asSingle()
    }

}
