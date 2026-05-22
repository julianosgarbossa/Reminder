//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import Foundation
import UIKit

protocol ViewControllersFactoryProtocol {
    func makeSplashViewController(delegate: SplashCoordinatorDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(delegate: LoginBottomSheetCoordinatorDelegate) -> LoginBottomSheetViewController
}

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(delegate: SplashCoordinatorDelegate) -> SplashViewController {
        let screen: SplashScreen = SplashScreen()
        let splashViewController: SplashViewController = SplashViewController(screen: screen, delegate: delegate)
        return splashViewController
    }
    
    func makeLoginBottomSheetViewController(delegate: LoginBottomSheetCoordinatorDelegate) -> LoginBottomSheetViewController {
        let screen: LoginBottomSheetScreen = LoginBottomSheetScreen()
        let loginBottomSheetViewController: LoginBottomSheetViewController = LoginBottomSheetViewController(screen: screen, delegate: delegate)
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        return loginBottomSheetViewController
    }
}
