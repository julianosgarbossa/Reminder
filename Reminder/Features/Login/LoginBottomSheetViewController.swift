//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 10/02/26.
//

import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    private let loginBottomSheetView = LoginBottomSheetView()
    private let handleAreaHeight: CGFloat = 50.0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupGesture()
    }
    
    private func setupUI() {
        self.view.addSubview(loginBottomSheetView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        loginBottomSheetView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginBottomSheetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginBottomSheetView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginBottomSheetView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            loginBottomSheetView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
        ])
    }
    
    private func setupGesture() {
//        let panGesture = UIPanGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
    }
    
    private func handlePanGesture() {
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginBottomSheetView.transform = CGAffineTransform(translationX: 0, y: loginBottomSheetView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginBottomSheetView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}

