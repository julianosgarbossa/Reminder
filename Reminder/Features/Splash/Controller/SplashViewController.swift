//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

class SplashViewController: UIViewController {
    
    private let screen: SplashScreen = SplashScreen()
    
    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationControler()
    }
    
    private func configNavigationControler() {
        navigationController?.navigationBar.isHidden = true
    }
}
