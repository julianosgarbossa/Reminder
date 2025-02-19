//
//  MyRecipeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 19/02/25.
//

import UIKit

class MyRecipeViewController: UIViewController {

    let myRecipeView: MyRecipeView
    
    init(myRecipeView: MyRecipeView) {
        self.myRecipeView = myRecipeView
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

#Preview {
    let myRecipeView = MyRecipeView()
    MyRecipeViewController(myRecipeView: myRecipeView)
}
