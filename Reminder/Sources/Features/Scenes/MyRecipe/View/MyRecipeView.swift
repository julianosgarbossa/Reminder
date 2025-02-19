//
//  MyRecipeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 19/02/25.
//

import UIKit

protocol MyRecipeViewDelegate: AnyObject {
    func didTapBackButton()
    func didTapAddNewRecipeButton()
}

class MyRecipeView: UIView {

    public weak var delegate: MyRecipeViewDelegate?
    
    let headerBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "myRecipe.backButton.image".localized), for: .normal)
        button.tintColor = Colors.gray100
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var newRecipeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "myRecipe.addButton.image".localized), for: .normal)
        button.addTarget(self, action: #selector(didTapAddNewRecipeButton), for: .touchUpInside)
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.heading
        label.textColor = Colors.blueBase
        label.text = "myRecipe.label.title".localized
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "myRecipe.label.description".localized
        label.numberOfLines = 0
        return label
    }()
    
    let viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        return view
    }()
    
    @objc
    private func didTapBackButton(_sender: UIButton) {
        self.delegate?.didTapBackButton()
    }
    
    @objc
    private func didTapAddNewRecipeButton(_sender: UIButton) {
        self.delegate?.didTapAddNewRecipeButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        self.addSubview(headerBackground)
        self.headerBackground.addSubview(backButton)
        self.headerBackground.addSubview(newRecipeButton)
        self.headerBackground.addSubview(titleLabel)
        self.headerBackground.addSubview(descriptionLabel)
        self.addSubview(viewBackground)

        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerBackground.topAnchor.constraint(equalTo: self.topAnchor),
            headerBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: self.headerBackground.safeAreaLayoutGuide.topAnchor, constant: Metrics.mediumLarge),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.mediumLarge),
            backButton.heightAnchor.constraint(equalToConstant: Metrics.medium),
            backButton.widthAnchor.constraint(equalToConstant: Metrics.medium),
            
            newRecipeButton.topAnchor.constraint(equalTo: backButton.topAnchor),
            newRecipeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.mediumLarge),
            newRecipeButton.heightAnchor.constraint(equalToConstant: Metrics.hugeSmall),
            newRecipeButton.widthAnchor.constraint(equalToConstant: Metrics.hugeSmall),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor, constant: -Metrics.mediumLarge),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            viewBackground.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 184),
            viewBackground.leadingAnchor.constraint(equalTo: headerBackground.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: headerBackground.trailingAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: headerBackground.bottomAnchor),
        ])
    }
}

#Preview {
    MyRecipeView()
}
