//
//  ViewControllerFactory.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/01/25.
//

import UIKit

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    func makeSplashViewController(splashFlowDelegate: SplashFlowDelegate) -> SplashViewController {
        let splashView = SplashView()
        let splashViewController = SplashViewController(splashView: splashView, splashFlowDelegate: splashFlowDelegate)
        return splashViewController
    }
    
    func makeLoginViewController(loginFlowDelegate: LoginFlowDelegate) -> LoginViewController {
        let loginView = LoginView()
        let loginViewController = LoginViewController(loginView: loginView, loginFlowDelegate: loginFlowDelegate)
        return loginViewController
    }
    
    func makeHomeViewController(homeFlowDelegate: HomeFlowDelegate) -> HomeViewController {
        let homeView = HomeView()
        let homeViewController = HomeViewController(homeView: homeView, homeFlowDelegate: homeFlowDelegate)
        return homeViewController
    }
    
    func makeNewRecipeViewController() -> NewRecipeViewController {
        let newRecipeView = NewRecipeView()
        let newRecipeViewController = NewRecipeViewController(newRecipeView: newRecipeView)
        return newRecipeViewController
    }
}
