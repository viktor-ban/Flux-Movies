//
//  Config.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

// swiftlint:disable force_cast

/**
 # Config
 Basic settings and application configuration, e.g. API URL.
 Contains current environment.
 */
struct Config {

    static let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as! String

    static let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String

    static let copyright = Bundle.main.object(forInfoDictionaryKey: "NSHumanReadableCopyright") as! String

    static var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Dev") != nil {
                return Environment.dev
            }
            if configuration.range(of: "Test") != nil {
                return Environment.test
            }
            if configuration.range(of: "Local") != nil {
                return Environment.local
            }
        }
        return Environment.production
    }()

    init() {
        let defaults = UserDefaults.standard
        defaults.set(Config.copyright, forKey: "copyright_preference")
        defaults.set(Config.version, forKey: "version_preference")
        defaults.synchronize()
    }

}
