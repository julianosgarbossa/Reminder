//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let screen: SplashScreen = SplashScreen()
    
    override func loadView() {
        view = screen
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheetViewController: LoginBottomSheetViewController = LoginBottomSheetViewController()
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.loginBottomSheetAnimateShow()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        configNavigationControler()
        setupTapGesture()
    }
    
    private func configNavigationControler() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        view.addGestureRecognizer(tap)
    }
}
