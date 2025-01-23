//
//  HomeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView
    private let homeViewModel = HomeViewModel()
    public weak var homeFlowDelegate: HomeFlowDelegate?

    init(homeView: HomeView, homeFlowDelegate: HomeFlowDelegate) {
        self.homeView = homeView
        self.homeFlowDelegate = homeFlowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setVisualElements()
        
    }
    
    private func setVisualElements() {
        self.view.addSubview(homeView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.setupContentViewToBounds(contentView: homeView)
    }
}
