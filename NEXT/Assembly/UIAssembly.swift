//
//  UIAssembly.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation
import Swinject
import SwinjectAutoregistration
import SwinjectStoryboard

class UIAssembly: Assembly {

    func assemble(container: Container) {
        container.register(UIViewController.self, factory: { _ in
            let vc = UIViewController()
            vc.view.backgroundColor = .blue
            return vc
        })
        
        container.register(DashboardViewController.self) { _ in
            return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        }.initCompleted { r, c in
            c.coordinator = r.resolve(MainCoordinatorType.self)
        }
    }
    
}
