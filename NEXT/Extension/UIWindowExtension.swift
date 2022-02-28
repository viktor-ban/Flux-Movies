//
//  UIWindowExtension.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

// http://stackoverflow.com/a/35773653

public extension UIWindow {
    
    public var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    public var presentedViewController: UIViewController? {
        return UIWindow.getPresentedViewControllerFrom(self.rootViewController)
    }
    
    public static func getVisibleViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(pvc)
            } else {
                return vc
            }
        }
    }
    
    public static func getPresentedViewControllerFrom(_ vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return nc.presentedViewController
        } else if let tc = vc as? UITabBarController {
            return tc.presentedViewController
        } else {
            return vc
        }
    }
}

func getRootViewController() -> UIViewController? {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let sceneDelegate = windowScene.delegate as? SceneDelegate
    else {
        return nil
    }
    return sceneDelegate.window?.rootViewController
}

func setRootViewController(_ vc: UIViewController) {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let sceneDelegate = windowScene.delegate as? SceneDelegate
    else {
        return
    }
    if let window = sceneDelegate.window {
        window.rootViewController = vc
    }
}

func getTopViewController() -> UIViewController? {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let sceneDelegate = windowScene.delegate as? SceneDelegate
    else {
        return nil
    }
    if let window = sceneDelegate.window {
        return window.visibleViewController
    }
    return nil
}

func getPresentedViewController() -> UIViewController? {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let sceneDelegate = windowScene.delegate as? SceneDelegate
    else {
        return nil
    }
    if let window = sceneDelegate.window {
        return window.presentedViewController
    }
    return nil
}

public let UIWindowLevelInfoAlert: UIWindow.Level = UIWindow.Level.alert + 1
public let UIWindowLevelErrorAlert: UIWindow.Level = UIWindow.Level.alert + 2
