//
//  NetworkManager.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 12/04/16.
//  Copyright © 2016 Domonkos Pal. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Alamofire

/**
 
 # NetworkingManager
 Handle network communictaion, build on Moya.
 
 */
protocol NetworkingManager {

    // MultiTarget API provider.
    // - seealso: [Moya Providers](https://github.com/Moya/Moya/blob/master/docs/Providers.md)
    var provider: MultiMoyaProvider {get}

}

class NetworkManager: NetworkingManager {

    fileprivate var _networkConfig: NetworkingConfig
    fileprivate var _networkDataManager: NetworkingDataManager
    fileprivate var _defaultPlugins: [PluginType] = []

    // MARK: - Providers

    fileprivate var _provider: MultiMoyaProvider!

    // MARK: - Constructor

    init(networkConfig: NetworkingConfig, networkDataManager: NetworkingDataManager, authPlugin: PluginType) {
        _networkConfig = networkConfig
        _networkDataManager = networkDataManager
        _defaultPlugins = [networkActivityPlugin, NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration.init()), authPlugin]
        _provider = self.newProviderWithDefaults(_defaultPlugins)
    }

    // MARK: - Alamofire mangaer

    fileprivate func customAlamofireManager() -> Session {
        let configuration = URLSessionConfiguration.default

        configuration.httpAdditionalHeaders = URLSessionConfiguration.default.httpAdditionalHeaders

        configuration.timeoutIntervalForRequest = _networkConfig.timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = _networkConfig.timeoutIntervalForResource
        
        let session = Session(
           configuration: URLSessionConfiguration.default,
           startRequestsImmediately: true
        )
        
        
        return session
    }
    
    // MARK: - Plugins
    
    fileprivate let networkActivityPlugin = NetworkActivityPlugin(networkActivityClosure: { change, _  in
        // TODO: Change to BOTNetworkActivityIndicator push / pop
        // TODO: add global activity indicator
        switch change {
        case .began:
            ActivityIndicator.pushIndicator()
            //UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        case .ended:
            ActivityIndicator.popIndicator()
            //UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    })

    // MARK: - Closures
    
    fileprivate func endpointClosure<T>(_ target: T) -> Endpoint where T: TargetType {
        let t = target
        let url = t.baseURL.appendingPathComponent(t.path).absoluteString
        let endpoint: Endpoint = Endpoint(
            url: url,
            sampleResponseClosure: {
                //return .NetworkError(NSError(domain: NSURLErrorDomain, code: NSURLErrorNotConnectedToInternet, userInfo: nil))
                //return .NetworkError(NSError(domain: NSURLErrorDomain, code: NSURLErrorTimedOut, userInfo: nil))
                //return .NetworkResponse(500, "INTERNAL SERVER ERROR".dataUsingEncoding(NSUTF8StringEncoding)!)
                //return .NetworkResponse(400, "BAD STRING FORMAT".dataUsingEncoding(NSUTF8StringEncoding)!)
                //return .NetworkResponse(400, "{\"code\": \"400\", \"message\": \"Error\"}".dataUsingEncoding(NSUTF8StringEncoding)!)
                return .networkResponse(200, t.sampleData)
        },
            method: t.method,
            task: t.task,
            httpHeaderFields: t.headers)
        
        return endpoint
    }
    
    fileprivate func requestClosure(_ endpoint: Endpoint, done: MultiMoyaProvider.RequestResultClosure) {
        do {
            var request: URLRequest = try endpoint.urlRequest() as URLRequest
            request.cachePolicy = _networkConfig.cachePolicy
            request.httpShouldHandleCookies = false
            done(.success(request))
            return
        } catch _ {
            // Error handling
        }
    }

    fileprivate func stubClosure<T>(_ target: T) -> Moya.StubBehavior where T: TargetType {

        // StubBehavior values:
        // .never
        // .immediate
        // .delayed(seconds: TimeInterval)

        if _networkConfig.stubEnabled {
            let delay = _networkConfig.stubDelay
            if delay > 0 {
                return .delayed(seconds: delay)
            }
            return .immediate
        }

        // Example usage:

        // if T.self is UserAPI.Type {
        //     return .immediate
        // }
        // return .never

        return .never
    }

    fileprivate func newProviderWithDefaults(_ plugins: [PluginType]?) -> MultiMoyaProvider {
        let usedPlugins = plugins ?? _defaultPlugins
        
        return MultiMoyaProvider(endpointClosure: endpointClosure,
                                 requestClosure: requestClosure,
                                 stubClosure: stubClosure,
                                 session: Session(
                                    configuration: URLSessionConfiguration.default,
                                    startRequestsImmediately: false
                                 ),
                                 plugins: usedPlugins)
    }

    // MARK: - Getters

    var provider: MultiMoyaProvider {
        return self._provider
    }

}
