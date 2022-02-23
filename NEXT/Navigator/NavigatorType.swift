//
//  Navigator.swift
//  NEXT
//
//  Created by Ban_Viktor on 2022. 02. 22..
//

import UIKit

protocol NavigatorType {
    func setViewControllers(with viewControllers: [UIViewController])
    
    func transition<T>(to type: T.Type, animated: Bool) where T : UIViewController
    func dismiss(animated: Bool)
    func getNavigationController() -> UINavigationController
}
