//
//  NewRecipeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 30/01/25.
//

import UIKit

class NewRecipeView: UIView {

    let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "newRecipe.button.image".localized), for: .normal)
        button.tintColor = Colors.gray100
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.heading
        label.textColor = Colors.redBase
        label.text = "newRecipe.label.title".localized
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "newRecipe.label.description".localized
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Metrics.mediumLarge),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.mediumLarge),
            backButton.heightAnchor.constraint(equalToConstant: Metrics.medium),
            backButton.widthAnchor.constraint(equalToConstant: Metrics.medium),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.mediumLarge),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
        ])
    }
}
