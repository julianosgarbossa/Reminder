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
    
    private let screen: LoginBottomSheetScreen = LoginBottomSheetScreen()
    private let viewModel: LoginBottomSheetViewModel = LoginBottomSheetViewModel()
    private var handleAreaHeight: CGFloat = 50.0
    
    @objc
    private func loginBottomSheetAnimateHide() {
        UIView.animate(withDuration: 0.3) {
            self.screen.transform = CGAffineTransform(translationX: 0, y: self.screen.frame.height)
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    init(delegate: LoginBottomSheetCoordinatorDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
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
    func successResult() {
        print("Usuário logado com sucesso!")
        delegate?.navigateToHome()
    }
    
    func failure(error: String) {
        print("Erro ao logar: \(error)")
    }
}
