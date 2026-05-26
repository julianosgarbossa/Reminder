//
//  HomeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
