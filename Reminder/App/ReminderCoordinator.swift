//
//  ReminderCoordinator.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/05/26.
//

import Foundation
import UIKit

class ReminderCoordinator {
    // MARK: Properties
    private var navigationController: UINavigationController?
    
    // MARK: Init
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
    }
    
    // MARK: Start
    func start() -> UINavigationController? {
        let splashViewController: SplashViewController = SplashViewController(delegate: self)
        navigationController = UINavigationController(rootViewController: splashViewController)
        return navigationController
    }
}

// MARK: Splash
extension ReminderCoordinator: SplashCoordinatorDelegate {
    func showLoginBottomSheet() {
        let loginBottomSheetViewController: LoginBottomSheetViewController = LoginBottomSheetViewController(delegate: self)
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        navigationController?.topViewController?.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.loginBottomSheetAnimateShow()
        }
    }
}

// MARK: Login
extension ReminderCoordinator: LoginBottomSheetCoordinatorDelegate {
    func navigateToHome() {
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .red
        navigationController?.dismiss(animated: false) {
            self.navigationController?.setViewControllers([homeViewController], animated: true)
        }
    }
}
