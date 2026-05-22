//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

protocol SplashCoordinatorDelegate: AnyObject {
    func showLoginBottomSheet()
    func showHome()
}

class SplashViewController: UIViewController {
    
    private let screen: SplashScreen
    private weak var delegate: SplashCoordinatorDelegate?
    
    init(screen: SplashScreen, delegate: SplashCoordinatorDelegate) {
        self.screen = screen
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = screen
    }
    
    @objc
    private func showLoginBottomSheet() {
        animateLogoUp()
        delegate?.showLoginBottomSheet()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        configNavigationControler()
        setupTapGesture()
        startBreathingAnimation()
    }
    
    private func configNavigationControler() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        view.addGestureRecognizer(tap)
    }
    
    private func decideNavigation() {
        if let user = UserDefaultsManager.shared.loadUser() , user.isUserSaved {
            delegate?.showHome()
        } else {
            showLoginBottomSheet()
        }
    }
}

// MARK: - Animações
extension SplashViewController {
    private func startBreathingAnimation() {
        UIView.animate(withDuration: 1.5, delay: 0.0) { [weak self] in
            self?.screen.logoImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { [weak self] _ in
            self?.decideNavigation()
        }
    }
    
    private func animateLogoUp() {
        screen.logoImageView.transform = .identity
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut]) { [weak self] in
            guard let self else { return }
            self.screen.logoImageView.transform = self.screen.logoImageView.transform.translatedBy(x: 0, y: -100)
            
        }
    }
}
