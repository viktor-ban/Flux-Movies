//
//  Navigator.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import UIKit
import SwinjectStoryboard

class Navigator: NavigatorType {
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func setViewControllers(with viewControllers: [UIViewController]) {
        navigationController.viewControllers = viewControllers
    }
    
    func transition<T>(to type: T.Type, animated: Bool) where T : UIViewController {
        let vc = SwinjectStoryboard.defaultContainer.resolve(T.self)!
        navigationController.pushViewController(vc, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        //
    }
    
}
