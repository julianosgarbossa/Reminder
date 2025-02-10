//
//  NewRecipeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 30/01/25.
//

import UIKit

class NewRecipeViewController: UIViewController {
    
    private let newRecipeView = NewRecipeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setVisualElements()
//        self.setActions()
    }
    
    private func setVisualElements() {
        self.view.addSubview(newRecipeView)
        
        self.view.backgroundColor = Colors.gray800
        self.navigationController?.navigationBar.isHidden = true
        
        self.setConstrains()
    }
    
    private func setConstrains() {
        newRecipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newRecipeView.topAnchor.constraint(equalTo: self.view.topAnchor),
            newRecipeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            newRecipeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            newRecipeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setActions() {
        
    }
}
