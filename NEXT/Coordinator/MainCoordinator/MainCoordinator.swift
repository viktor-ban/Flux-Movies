//
//  MainCoordinator.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation
import SwinjectStoryboard

class MainCoordinator: MainCoordinatorType, Coordinator {
    var children: [Coordinator] = [Coordinator]()
    var navigator: NavigatorType!
    
    init(navigator: NavigatorType) {
        self.navigator = navigator
    }
    
    func start() {
        let vc = SwinjectStoryboard.defaultContainer.resolve(DashboardViewController.self)!
        vc.coordinator = self
        navigator.setViewControllers(with: [vc])
    }
    
    func toMovieDetails() {
        navigator.transition(to: UIViewController.self, animated: true)
    }
}
