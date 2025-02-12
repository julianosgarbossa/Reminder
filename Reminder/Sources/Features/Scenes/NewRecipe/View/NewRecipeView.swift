//
//  NewRecipeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 30/01/25.
//

import UIKit

class NewRecipeView: UIView {

    public let backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "newRecipe.button.image".localized), for: .normal)
        button.tintColor = Colors.gray100
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.heading
        label.textColor = Colors.redBase
        label.text = "newRecipe.label.title".localized
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "newRecipe.label.description".localized
        label.numberOfLines = 0
        return label
    }()
    
    let remedyInput: InputNewRecipeView = {
        let input = InputNewRecipeView(title: "newRecipe.inputRemedy.title".localized,
                                       placeholder: "newRecipe.inputRemedy.placeholder".localized)
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let timeInput: InputNewRecipeView = {
        let input = InputNewRecipeView(title: "newRecipe.inputTime.title".localized,
                                       placeholder: "newRecipe.inputTime.placeholder".localized)
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let recurrenceInput: InputNewRecipeView = {
        let input = InputNewRecipeView(title: "newRecipe.inputRecurrence.title".localized,
                                       placeholder: "newRecipe.inputRecurrence.placeholder".localized)
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let checkBox: CheckboxView = {
        let checkBox = CheckboxView(title: "newRecipe.checkbox.title".localized)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        return checkBox
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.redBase
        button.titleLabel?.textColor = Colors.gray800
        button.layer.cornerRadius = Metrics.medium
        button.titleLabel?.font = Typography.subHeading
        button.setTitle( "newRecipe.button.add".localized, for: .normal)
        button.setImage(UIImage(named: "newRecipe.button.add.icon".localized), for: .normal)
        button.tintColor = Colors.gray800
        return button
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
        self.addSubview(remedyInput)
        self.addSubview(timeInput)
        self.addSubview(recurrenceInput)
        self.addSubview(checkBox)
        self.addSubview(addButton)
        
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
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.hugeSmall),
            remedyInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            remedyInput.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Metrics.mediumSmall),
            timeInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeInput.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.mediumSmall),
            recurrenceInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            recurrenceInput.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            checkBox.topAnchor.constraint(equalTo: recurrenceInput.bottomAnchor, constant: Metrics.mediumSmall),
            checkBox.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.tiny * 2),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.tiny * 2),
            addButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.smallLarge),
            addButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
}

#Preview {
    NewRecipeView()
}
