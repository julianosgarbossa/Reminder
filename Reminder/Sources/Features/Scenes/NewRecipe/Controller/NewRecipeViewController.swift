//
//  NewRecipeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 30/01/25.
//

import UIKit
import Lottie

class NewRecipeViewController: UIViewController {
    
    private let newRecipeView: NewRecipeView
    private let newRecipeViewModel = NewRecipeViewModel()
    
    let successAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "Success")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.isHidden = true
        return animationView
    }()
    
    @objc
    private func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
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
        self.playSuccessAnimation()
        print("Receita \(remedy) adicionda")
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationItem.hidesBackButton = true
    }
    
    private func setVisualElements() {
        self.view.addSubview(newRecipeView)
        self.view.addSubview(successAnimationView)
        
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
            
            successAnimationView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            successAnimationView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            successAnimationView.heightAnchor.constraint(equalToConstant: 250),
//            successAnimationView.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func setActions() {
        self.newRecipeView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        self.newRecipeView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    private func playSuccessAnimation() {
        successAnimationView.isHidden = false
        successAnimationView.play { [weak self] finished in
            if finished {
                self?.successAnimationView.isHidden = true
                self?.newRecipeView.clearFieldsAndDisableButton()
            }
        }
    }
}

#Preview {
    let newRecipeView = NewRecipeView()
    NewRecipeViewController(newRecipeView: newRecipeView)
}
