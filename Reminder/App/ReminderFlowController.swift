//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/02/26.
//

import Foundation
import UIKit

class ReminderFlowController {
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    // MARK: - Init
    init() {
        
    }
    
    // MARK: - StartFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

// MARK: - Splash
extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheetViewController = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        navigationController?.present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }
    }
}

// MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        navigationController?.dismiss(animated: false)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        navigationController?.pushViewController(viewController, animated: true)
    }
}
