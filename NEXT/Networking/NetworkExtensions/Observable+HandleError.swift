//
//  Observable+HandleError.swift
//  Boilerplate
//
//  Created by Domonkos Pal on 03/05/16.
//  Copyright © 2016 Domonkos Pal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

public extension ObservableType where Element: Codable {

    func handleErrorGlobalMapped(_ viewController: UIViewController? = nil) -> Observable<Element> {
        return handleErrorGlobal(viewController)
    }

}

public extension ObservableType where Element: Collection, Element.Iterator.Element: Codable {

    func handleErrorGlobalMapped(_ viewController: UIViewController? = nil) -> Observable<Element> {
        return handleErrorGlobal(viewController)
    }

}

public extension ObservableType where Element == Response {

    func handleErrorGlobalResponse(_ viewController: UIViewController? = nil) -> Observable<Element> {
        return handleErrorGlobal(viewController)
    }

}

public extension ObservableType {
    
    //TODO: Remove wrong error messages

    // swiftlint:disable:next cyclomatic_complexity function_body_length
    fileprivate func handleErrorGlobal(_ viewController: UIViewController? = nil) -> Observable<Element> {

        var handledError: Moya.MoyaError?

        let dialogSubject = BehaviorRelay<PublishSubject<Void>>(value: PublishSubject<Void>())

        let showDialog: (_ title: String?, _ message: String?, _ buttonLabel: String?) -> Void = {title, message, buttonLabel in
            var retryClosure: (() -> Void)? = nil
            if buttonLabel != nil {
                retryClosure = {
                    dialogSubject.value.onNext(())
                }
            }
            ErrorDialog.showErrorOnViewController(viewController, title: title, message: message, buttonLabel: buttonLabel, close: {
                dialogSubject.value.onError(handledError!)
            }, retry: retryClosure)
        }

        let showDefaultDialog = {
            showDialog("L10n.error", "L10n.errorServer", "L10n.retry")
        }

        return self.do(onError: { error in

            handledError = error as? Moya.MoyaError
            dialogSubject.accept(PublishSubject<Void>())

            if let moyaError = error as? Moya.MoyaError {
                switch moyaError {

                case .jsonMapping(_):
                    showDefaultDialog()

                case .statusCode(let response):
                    if (400...499).contains(response.statusCode) {
                        guard let e = ErrorModel.fromJSON(data: response.data) else {
                            showDefaultDialog()
                            return
                        }
                        showDialog("L10n.error", e.message, nil)
                    } else {
                        showDefaultDialog()
                    }

                case .underlying(let nsError as NSError, let response):

                    if let r = response, let e = ErrorModel.fromJSON(data: r.data) {
                        showDialog("L10n.error", e.message, nil)
                        return
                    }

                    if nsError.code == NSURLErrorTimedOut {
                        showDialog("L10n.error", "L10n.errorTimeout", "L10n.retry")
                    } else if nsError.code == NSURLErrorNotConnectedToInternet {
                        showDialog("L10n.error", "L10n.errorNoNetwork", "L10n.retry")
                    } else if nsError.code == NSURLErrorCannotConnectToHost {
                        showDialog("L10n.error", "L10n.errorCouldNotConnect", "L10n.retry")
                    } else {
                        showDefaultDialog()
                    }

                default:
                    showDefaultDialog()
                }
            }
        }).retryWhen({ _ in
            return dialogSubject.asObservable().skip(1).flatMap({ subject -> PublishSubject<Void> in
                return subject
            })
        })
    }

}
