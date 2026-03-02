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
    
    private let contentView: LoginBottomSheetView
    private let viewModel = LoginBottomSheetViewModel()
    private let handleAreaHeight: CGFloat = 50.0
    weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: LoginBottomSheetView,
         flowDelegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
        contentView.delegate(delegate: self)
        bindViewModel()
    }
    
    private func setupUI() {
        self.view.addSubview(contentView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.6),
        ])
    }
    
    private func setupGesture() {
//        let panGesture = UIPanGestureRecognizer(target: <#T##Any?#>, action: <#T##Selector?#>)
    }
    
    private func handlePanGesture() {
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.contentView.transform = .identity
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

