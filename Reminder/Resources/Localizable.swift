//
//  Localizable.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import Foundation

enum Localizable {
    enum LoginBottomSheet {
        static let title = String(localized: "loginBottomSheet.title")
        static let emailTitle = String(localized: "loginBottomSheet.email.title")
        static let emailPlaceholder = String(localized: "loginBottomSheet.email.placeholder")
        static let passwordTitle = String(localized: "loginBottomSheet.password.title")
        static let passwordPlaceholder = String(localized: "loginBottomSheet.password.placeholder")
        static let loginButtonTitle = String(localized: "loginBottomSheet.loginButton.title")
    }
    
    enum LoginBottomSheetAlertSuccess {
        static let title = String(localized: "loginBottomSheet.alert.title")
        static let message = String(localized: "loginBottomSheet.alert.message")
        static let actionYes = String(localized: "loginBottomSheet.alert.action.yes")
        static let actionNo = String(localized: "loginBottomSheet.alert.action.no")
    }
    
    enum LoginBottomSheetAlertError {
        static let title = String(localized: "loginBottomSheet.alert.error.title")
        static let message = String(localized: "loginBottomSheet.alert.error.message")
        static let actionRetry = String(localized: "loginBottomSheet.alert.error.action.retry")
    }
    
    enum Home {
        static let welcome = String(localized: "home.welcome.title")
        static let namePlaceholder = String(localized: "home.name.placeholder")
        static let buttonTitle = String(localized: "home.feedbackButton.title")
    }
}
