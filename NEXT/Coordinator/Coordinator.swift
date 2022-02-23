//
//  Coordinator.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation

protocol Coordinator {
    var children: [Coordinator] { get set }
    var navigator: NavigatorType! { get }
    
    func start()
}
