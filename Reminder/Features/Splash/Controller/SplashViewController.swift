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
        delegate?.showLoginBottomSheet()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        configNavigationControler()
        setupTapGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        decideNavigation()
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
