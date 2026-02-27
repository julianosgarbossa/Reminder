//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 10/02/26.
//

import UIKit

protocol LoginBottomSheetFlowDelegate: AnyObject {
    func navigateToHome()
}

class LoginBottomSheetViewController: UIViewController {
    
    private var loginBottomSheetView = LoginBottomSheetView()
    private let viewModel = LoginBottomSheetViewModel()
    private let handleAreaHeight: CGFloat = 50.0
    weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(flowDelegate: LoginBottomSheetFlowDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.flowDelegate = flowDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
        loginBottomSheetView.delegate(delegate: self)
        bindViewModel()
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
            loginBottomSheetView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
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
    
    private func bindViewModel() {
        viewModel.sucessResult = { [weak self] in
            self?.flowDelegate?.navigateToHome()
        }
        
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(user: user, password: password)
    }
}

