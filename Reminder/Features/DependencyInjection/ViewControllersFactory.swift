//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/02/26.
//

import Foundation
import UIKit

protocol ViewControllersFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
}

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let splashViewController = SplashViewController(contentView: contentView,
                                                        flowDelegate: flowDelegate)
        return splashViewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let loginBottomSheetViewController = LoginBottomSheetViewController(contentView: contentView,
                                                                            flowDelegate: flowDelegate)
        return loginBottomSheetViewController
    }
}

