//
//  StubbedResponse.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 2017. 08. 25..
//  Copyright © 2017. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation

func stubbedResponse(_ filename: String) -> Data {
    let bundle = Bundle.main
    if let path = bundle.path(forResource: filename, ofType: "json"),
        let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
        return data
    }
    let error = ErrorModel(
        code: 500,
        message: "Stub not found!"
    )
    return error.toJSONData() ?? Data()
}
