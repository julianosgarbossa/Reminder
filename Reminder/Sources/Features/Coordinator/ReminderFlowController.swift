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
        let startViewController = viewControllerFactory.makeSplashViewController(splashFlowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}

// MARK: Splash
extension ReminderFlowController: SplashFlowDelegate {
    
    func AutomaticNavigateToHome() {
        self.navigationController?.presentedViewController?.dismiss(animated: false)
        let homeViewController = viewControllerFactory.makeHomeViewController(homeFlowDelegate: self)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
    
    func openLogin() {
        let loginViewController = viewControllerFactory.makeLoginViewController(loginFlowDelegate: self)
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
        self.navigationController?.presentedViewController?.dismiss(animated: false)
        let homeViewController = viewControllerFactory.makeHomeViewController(homeFlowDelegate: self)
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}

// MARK: Home
extension ReminderFlowController: HomeFlowDelegate {
    func logout() {
        self.navigationController?.popViewController(animated: false)
        self.navigationController?.navigationBar.isHidden = true
        self.openLogin()
    }
    
    func navigateToMyRecipe() {
        let myRecipeViewController = viewControllerFactory.makeMyRecipeViewController(myRecipeFlowDelegate: self)
        self.navigationController?.pushViewController(myRecipeViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func navigateToNewRecipe() {
        let newRecipeViewController = viewControllerFactory.makeNewRecipeViewController()
        self.navigationController?.pushViewController(newRecipeViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
}

// MARK: My Recipe
extension ReminderFlowController: MyRecipeFlowDelegate {
    func popScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func goToNewRecipe() {
        self.navigateToNewRecipe()
    }
}
