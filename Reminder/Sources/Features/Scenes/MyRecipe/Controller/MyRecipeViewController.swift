//
//  MyRecipeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 19/02/25.
//

import UIKit

class MyRecipeViewController: UIViewController {

    private let myRecipeView: MyRecipeView
    private weak var myRecipeFlowDelegate: MyRecipeFlowDelegate?
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    init(myRecipeView: MyRecipeView, myRecipeFlowDelegate: MyRecipeFlowDelegate) {
        self.myRecipeView = myRecipeView
        self.myRecipeFlowDelegate = myRecipeFlowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setVisualElements()
        self.setAction()
    }
    
    private func setAction() {
        self.myRecipeView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    private func setVisualElements() {
        self.view.addSubview(myRecipeView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        myRecipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myRecipeView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myRecipeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myRecipeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myRecipeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

//#Preview {
//    let myRecipeView = MyRecipeView()
//    MyRecipeViewController(myRecipeView: myRecipeView, myRecipeFlowDelegate: )
//}
