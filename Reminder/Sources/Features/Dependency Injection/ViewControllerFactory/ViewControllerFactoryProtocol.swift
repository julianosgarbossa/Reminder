//
//  ViewControllerFactoryProtocol.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/01/25.
//

import Foundation

protocol ViewControllerFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginViewController(flowDelegate: LoginFlowDelegate) -> LoginViewController
}
