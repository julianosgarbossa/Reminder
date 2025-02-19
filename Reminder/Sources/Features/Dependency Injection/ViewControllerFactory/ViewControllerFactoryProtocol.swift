//
//  ViewControllerFactoryProtocol.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/01/25.
//

import Foundation

protocol ViewControllerFactoryProtocol: AnyObject {
    func makeSplashViewController(splashFlowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginViewController(loginFlowDelegate: LoginFlowDelegate) -> LoginViewController
    func makeHomeViewController(homeFlowDelegate: HomeFlowDelegate) -> HomeViewController
    func makeNewRecipeViewController() -> NewRecipeViewController
    func makeMyRecipeViewController(myRecipeFlowDelegate: MyRecipeFlowDelegate) -> MyRecipeViewController
}
