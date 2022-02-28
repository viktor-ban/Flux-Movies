//
//  Environment.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

// swiftlint:disable redundant_string_enum_value

/**
 # Environment
 Enviroments for different configurations.
 */
enum Environment: String {

    case dev = "dev"
    case test = "test"
    case local = "local"
    case production = "production"

}

extension Environment {
    
    var baseURL: String {
        return "http://10.10.10.213:8090/api"
    }

    var apiKey: String {
        switch self {
        case .dev: return "sGcXJs2vZIp6kYIiIusBJKQl3jwBF6ktALyzrzbA1LprmqAlgqV63afnw5oVKh/7"
        case .test: return "sGcXJs2vZIp6kYIiIusBJKQl3jwBF6ktALyzrzbA1LprmqAlgqV63afnw5oVKh/7"
        case .local: return "sGcXJs2vZIp6kYIiIusBJKQl3jwBF6ktALyzrzbA1LprmqAlgqV63afnw5oVKh/7"
        case .production: return "sGcXJs2vZIp6kYIiIusBJKQl3jwBF6ktALyzrzbA1LprmqAlgqV63afnw5oVKh/7"
        }
    }

    var customURLScheme: String {
        switch self {
        case .dev: return "movies-dev"
        case .test: return "movies-test"
        case .local: return "movies-local"
        case .production: return "movies"
        }
    }

}
