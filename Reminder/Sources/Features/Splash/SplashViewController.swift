//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 17/12/24.
//

import UIKit

class SplashViewController: UIViewController {

    private let splashView: SplashView
    public weak var splashFlowDelegate: SplashFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGesture()
        
        // ciclo de desição se vai para login ou para menu
        self.setVisualElements()
    }
    
    init(splashView: SplashView, splashFlowDelegate: SplashFlowDelegate?) {
        self.splashView = splashView
        self.splashFlowDelegate = splashFlowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        self.view.addSubview(splashView)
        self.navigationController?.navigationBar.isHidden = false
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        splashView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: self.view.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLogin))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLogin() {
        self.splashFlowDelegate?.openLogin()
    }
}
