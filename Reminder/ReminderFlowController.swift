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
    private let viewControllerFactory: ViewControllerFactory
    
    // MARK: init
    public init() {
        self.viewControllerFactory = ViewControllerFactory()
    }
    
    // MARK: startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

// MARK: Splash
extension ReminderFlowController: SplashFlowDelegate {
    
    func nagigateToHome() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = Colors.redBase
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func openLogin() {
        let loginViewController = viewControllerFactory.makeLoginViewController(flowDelegate: self)
        loginViewController.modalPresentationStyle = .overCurrentContext
        loginViewController.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginViewController, animated: false) {
            loginViewController.animatedShow()
        }
    }
}

// MARK: Login
extension ReminderFlowController: LoginFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = Colors.redBase
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
