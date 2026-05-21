//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

protocol SplashCoordinatorDelegate: AnyObject {
    func showLoginBottomSheet()
}

class SplashViewController: UIViewController {
    
    private let screen: SplashScreen = SplashScreen()
    private weak var delegate: SplashCoordinatorDelegate?
    
    init(delegate: SplashCoordinatorDelegate) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
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
    
    private func configNavigationControler() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        view.addGestureRecognizer(tap)
    }
}
