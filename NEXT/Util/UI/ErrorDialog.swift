//
//  ErrorDialog.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

// swiftlint:disable function_parameter_count

/**
 
 # ErroryDialog
 Newtork error (and any other error) dialog.
 
 */
class ErrorDialog {

    /**
     Show error dialog on calculated top view controller.
     
     - parameter title:       dialog title
     - parameter message:     dialog message
     - parameter buttonLabel: label of retry, if not set retry clousre is never called
     - parameter close:       closure of close event
     - parameter retry:       closure of retry event
     */
    class func showError(_ title: String?, message: String?, buttonLabel: String?, close: @escaping () -> Void, retry: (() -> Void)?) {

        if let vc = getTopViewController() {
            ErrorDialog.showErrorOnViewController(vc, title: title, message: message, buttonLabel: buttonLabel, close: close, retry: retry)
        }

    }

    /**
     Show error dialog on given view controller.
     
     - parameter viewController: view controller to show dialog on
     - parameter title:       dialog title
     - parameter message:     dialog message
     - parameter buttonLabel: label of retry, if not set retry clousre is never called
     - parameter close:       closure of close event
     - parameter retry:       closure of retry event
     */
    class func showErrorOnViewController(_ viewController: UIViewController?, title: String?, message: String?, buttonLabel: String?, close: @escaping () -> Void, retry: (() -> Void)?) {

        var vc = viewController
        if vc == nil {
            vc = getTopViewController()
        }

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .cancel) { (_) in
            close()
        }
        alertController.addAction(closeAction)

        if let button = buttonLabel, let retryCallback = retry {
            let retryAction = UIAlertAction(title: button, style: .default) { (_) in
                retryCallback()
            }
            alertController.addAction(retryAction)

        }

        vc?.present(alertController, animated: true) {}
        //return alertController

    }

}
