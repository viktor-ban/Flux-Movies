//
//  Movie.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 28..
//

import Foundation

class Movie: Codable {
    
    var id: Int?
    var name: String?
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}
