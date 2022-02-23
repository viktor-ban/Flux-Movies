//
//  CoordinatorAssembly.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

class CoordinatorAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(MainCoordinatorType.self, initializer: MainCoordinator.init).inObjectScope(.container)
    }
    
}
