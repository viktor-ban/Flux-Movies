//
//  UIViewControllerExtension.swift
//  Food
//
//  Created by Hiflylabs Co. Ltd.
//  Copyright © 2018. Hiflylabs Co. Ltd. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //TODO: Remove L10n stirng
    
    func showAlert(title: String, message: String, confirmTitle: String, confirmHandler: @escaping (UIAlertAction)-> () = {_ in}, cancelButton: Bool = false, cancelAction: @escaping (UIAlertAction)->() = {_ in}, cancelTitle: String = "L10n.cancel") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default, handler: confirmHandler)
        alertController.addAction(confirmAction)
        
        if cancelButton {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelAction)
            alertController.addAction(cancelAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }

}
