//
//  NewRecipeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 30/01/25.
//

import UIKit

class NewRecipeViewController: UIViewController {
    
    private let newRecipeView: NewRecipeView
    private let newRecipeViewModel = NewRecipeViewModel()
    
    init(newRecipeView: NewRecipeView) {
        self.newRecipeView = newRecipeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setVisualElements()
        self.setActions()
    }
    
    private func setVisualElements() {
        self.view.addSubview(newRecipeView)
        
        self.view.backgroundColor = Colors.gray800
        
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
        self.newRecipeView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.newRecipeView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        let remedy = newRecipeView.remedyInput.getText()
        let time = newRecipeView.timeInput.getText()
        let recurrence = newRecipeView.recurrenceInput.getText()
        let takeNow = false
        self.newRecipeViewModel.addRecipe(remedy: remedy,
                                          time: time,
                                          recurrence: recurrence,
                                          takeNow: takeNow)
        print("Receita \(remedy) adicionda")
    }
}

#Preview {
    let newRecipeView = NewRecipeView()
    NewRecipeViewController(newRecipeView: newRecipeView)
}
