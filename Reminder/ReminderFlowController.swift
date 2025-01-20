//
//  ReminderCoordinator.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 20/01/25.
//

import UIKit

class ReminderFlowController {
    // MARK: Properties
    private var navigationController: UINavigationController?
//    private let viewControllerFactory
    
    // MARK: init
    public init() {
        
    }
    
    // MARK: startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(splashFlowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

// MARK: Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLogin() {
        let loginViewController = LoginViewController(loginFlowDelegate: self)
        loginViewController.modalPresentationStyle = .overCurrentContext
        loginViewController.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginViewController, animated: true) {
            loginViewController.animatedShow()
        }
    }
}

// MARK: Login
extension ReminderFlowController: LoginFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
