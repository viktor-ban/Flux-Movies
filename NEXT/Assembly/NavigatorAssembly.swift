//
//  NavigatorAssembly.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

class NavigatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(NavigatorType.self, initializer: Navigator.init).inObjectScope(.container)
    }
    
}
