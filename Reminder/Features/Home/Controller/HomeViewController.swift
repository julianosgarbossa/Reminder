//
//  HomeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func logout()
}

class HomeViewController: UIViewController {

    private weak var delegate: HomeCoordinatorDelegate?
    private var screen: HomeScreen
    
    init(screen: HomeScreen, delegate: HomeCoordinatorDelegate) {
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
    private func tappedLogoutButton(_ sender: UIBarButtonItem) {
        UserDefaultsManager.shared.removeUser()
        delegate?.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupNavigationBar() {
        let logoutButton = UIBarButtonItem(image: Icon.image(named: Icon.Name.logOut), style: .plain, target: self, action: #selector(tappedLogoutButton))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
}
