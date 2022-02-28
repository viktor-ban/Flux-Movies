//
//  Navigator.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import UIKit
import SwinjectStoryboard

class Navigator: NavigatorType {
    
    private var navigationController: UINavigationController = UINavigationController()
    
    init() {
    }
    
    func getNavigationController() -> UINavigationController {
        return navigationController
    }
    
    func setViewControllers(with viewControllers: [UIViewController]) {
        navigationController.viewControllers = viewControllers
    }
    
    func transition<T>(to type: T.Type, animated: Bool) where T : UIViewController {
        transition(to: type, animated: animated, parameters: nil)
    }
    
    func transition<T>(to type: T.Type, animated: Bool, parameters: [String:Any]?) where T : UIViewController {
        let vc = SwinjectStoryboard.defaultContainer.resolve(T.self)!
        
        if let parameters = parameters {
            vc.setup(with: parameters)
        }
        
        navigationController.pushViewController(vc, animated: animated)
    }
    
    func dismiss(animated: Bool) {
        //
    }
    
}
