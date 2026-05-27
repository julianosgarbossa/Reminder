//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

protocol LoginBottomSheetCoordinatorDelegate: AnyObject {
    func navigateToHome()
}

class LoginBottomSheetViewController: UIViewController {
    
    private weak var delegate: LoginBottomSheetCoordinatorDelegate?
    
    private let screen: LoginBottomSheetScreen
    private let viewModel: LoginBottomSheetViewModel = LoginBottomSheetViewModel()
    
    @objc
    private func loginBottomSheetAnimateHide() {
        UIView.animate(withDuration: 0.3) {
            self.screen.transform = CGAffineTransform(translationX: 0, y: self.screen.frame.height)
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    init(screen: LoginBottomSheetScreen, delegate: LoginBottomSheetCoordinatorDelegate) {
        self.screen = screen
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegates()
        setupSwipeGesture()
        configView()
        addVisualElements()
    }
    
    private func configView() {
        view.backgroundColor = .clear
        screen.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configDelegates() {
        screen.configDelegate(delegate: self)
        viewModel.configDelegate(delegate: self)
    }
    
    private func addVisualElements() {
        view.addSubview(screen)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            screen.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func setupSwipeGesture() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(loginBottomSheetAnimateHide))
        swipeDown.direction = .down
        view.addGestureRecognizer(swipeDown)
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: Localizable.LoginBottomSheetAlertSuccess.title,
                                                message: Localizable.LoginBottomSheetAlertSuccess.message,
                                                preferredStyle: .alert)
        let saveAction = UIAlertAction(title: Localizable.LoginBottomSheetAlertSuccess.actionYes,
                                       style: .default) { [weak self] _ in
            guard let self else { return }
            self.viewModel.saveLogin(email: email)
            self.delegate?.navigateToHome()
        }
        
        let cancelAction = UIAlertAction(title: Localizable.LoginBottomSheetAlertSuccess.actionNo, style: .cancel) { [weak self] _ in
            guard let self else { return }
            self.viewModel.continueWithoutSavingAccess(email: email)
            self.delegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    private func presentLoginErrorAlert(message: String) {
        let alertController = UIAlertController(title: Localizable.LoginBottomSheetAlertError.title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: Localizable.LoginBottomSheetAlertError.actionRetry, style: .cancel)
        
        alertController.addAction(retryAction)
        present(alertController, animated: true)
    }
    
    func loginBottomSheetAnimateShow(completion: (() -> Void)? = nil) {
        view.layoutIfNeeded()
        screen.transform = CGAffineTransform(translationX: 0, y: screen.frame.height)
        UIView.animate(withDuration: 0.3) {
            self.screen.transform = .identity
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion?()
        }
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetScreenDelegate {
    func sendLoginData(user: String, password: String) {
        viewModel.doAuth(user: user, password: password)
    }
}

extension LoginBottomSheetViewController: LoginBottomSheetViewModelDelegate {
    func successResult(email: String) {
        presentSaveLoginAlert(email: email)
    }
    
    func failure(error: String) {
        presentLoginErrorAlert(message: Localizable.LoginBottomSheetAlertError.message)
    }
}
