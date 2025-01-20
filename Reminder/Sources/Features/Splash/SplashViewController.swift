//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 17/12/24.
//

import UIKit

class SplashViewController: UIViewController {

    private let contentView = SplashView()
    public weak var splashFlowDelegate: SplashFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGesture()
        
        // ciclo de desição se vai para login ou para menu
        self.setVisualElements()
    }
    
    init(splashFlowDelegate: SplashFlowDelegate?) {
        super.init(nibName: nil, bundle: nil)
        self.splashFlowDelegate = splashFlowDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
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
