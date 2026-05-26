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
    private let viewControllersFactory: ViewControllersFactoryProtocol
    
    // MARK: Init
    init(navigationController: UINavigationController? = nil, viewControllersFactory: ViewControllersFactoryProtocol = ViewControllersFactory()) {
        self.navigationController = navigationController
        self.viewControllersFactory = viewControllersFactory
    }
    
    // MARK: Start
    func start() -> UINavigationController? {
        let splashViewController: SplashViewController = viewControllersFactory.makeSplashViewController(delegate: self)
        navigationController = UINavigationController(rootViewController: splashViewController)
        return navigationController
    }
}

// MARK: Splash
extension ReminderCoordinator: SplashCoordinatorDelegate {
    func showLoginBottomSheet() {
        let loginBottomSheetViewController: LoginBottomSheetViewController = viewControllersFactory.makeLoginBottomSheetViewController(delegate: self)
        navigationController?.topViewController?.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.loginBottomSheetAnimateShow()
        }
    }
    
    func showHome() {
        navigateToHome()
    }
}

// MARK: Login
extension ReminderCoordinator: LoginBottomSheetCoordinatorDelegate {
    func navigateToHome() {
        let homeViewController: HomeViewController = viewControllersFactory.makeHomeViewController(delegate: self)
        navigationController?.dismiss(animated: false) {
            self.navigationController?.setViewControllers([homeViewController], animated: true)
        }
    }
}

// MARK: Home
extension ReminderCoordinator: HomeCoordinatorDelegate {
    func logout() {
        let splashViewController: SplashViewController = viewControllersFactory.makeSplashViewController(delegate: self)
        self.navigationController?.setViewControllers([splashViewController], animated: true)
    }
}
