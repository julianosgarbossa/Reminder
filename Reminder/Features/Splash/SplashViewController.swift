//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 09/02/26.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let splashView = SplashView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // vai ter um ciclo de decisão se vai para login ou para home
        setup()
        setupGesture()
    }
    
    private func setup() {
        self.view.addSubview(splashView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        splashView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: view.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheetViewController = LoginBottomSheetViewController()
        
        loginBottomSheetViewController.modalPresentationStyle = .overCurrentContext
        loginBottomSheetViewController.modalTransitionStyle = .crossDissolve
        
        present(loginBottomSheetViewController, animated: false) {
            loginBottomSheetViewController.animateShow()
        }
    }
}
