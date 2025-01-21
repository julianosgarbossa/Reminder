//
//  ViewControllerFactory.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/01/25.
//

import UIKit

final class ViewControllerFactory: ViewControllerFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let splashView = SplashView()
        let splashViewController = SplashViewController(splashView: splashView, splashFlowDelegate: flowDelegate)
        return splashViewController
    }
    
    func makeLoginViewController(flowDelegate: LoginFlowDelegate) -> LoginViewController {
        let loginView = LoginView()
        let loginViewController = LoginViewController(loginView: loginView, loginFlowDelegate: flowDelegate)
        return loginViewController
    }
}
