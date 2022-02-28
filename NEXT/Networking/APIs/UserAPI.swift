//
//  UserAPI.swift
//  NAV-eFIP
//
//  Created by Ban_Viktor on 2022. 01. 31..
//

import Foundation
import Moya
import Alamofire

enum UserAPI {

    case salaryContribution
    case personalData
    case legalRelationship

}

extension UserAPI: TargetType {

    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {
        switch self {
        default:
            return JSONEncoding.default
        }
    }

    var path: String {
        switch self {
        case .salaryContribution:
            return "/salaryContribution"
        case .personalData:
            return "/personalData"
        case .legalRelationship:
            return "/legalRelationship"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }

    var sampleData: Data {
        switch self {
        case .salaryContribution:
            return stubbedResponse("SalaryContribution")
        case .personalData:
            return stubbedResponse("PersonalData")
        case .legalRelationship:
            return stubbedResponse("LegalRelationship")
        }
    }

}

// MARK: - BaseTargetType extension

extension UserAPI: BaseTargetType {

    var addAuthHeader: Bool {
        switch self {
        case .salaryContribution:
            return false
        case .personalData:
            return false
        case .legalRelationship:
            return false
        }
    }

}

// MARK: - StubbedTargetType extension

extension UserAPI: StubbedTargetType {

    var stubWithDelay: TimeInterval? {
        return 0
    }

}

// MARK: - DecodableTargetType extension

/*extension UserAPI: DecodableTargetType {
    typealias ResultType = User
}*/
