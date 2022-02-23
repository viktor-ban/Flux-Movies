//
//  MainCoordinator.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import Foundation
import SwinjectStoryboard

class MainCoordinator: MainCoordinatorType {
    var children: [Coordinator] = [Coordinator]()
    var navigator: NavigatorType!
    
    init(navigator: NavigatorType) {
        self.navigator = navigator
    }
    
    func start() {
        navigator.transition(to: DashboardViewController.self, animated: true)
    }
    
    func toMovieDetails() {
        navigator.transition(to: UIViewController.self, animated: true)
    }
}
