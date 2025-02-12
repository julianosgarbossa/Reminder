//
//  HomeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import UIKit

class HomeView: UIView {
    
    public weak var delegate: HomeDelegate?
    
    let profileBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    public lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Metrics.medium
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage(named: "home.image.avatar".localized)
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray200
        label.font = Typography.input
        label.text = "home.label.welcome".localized
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = Colors.gray100
        textField.font = Typography.heading
        textField.placeholder = "home.textfield.placeholder".localized
        textField.returnKeyType = .done
        return textField
    }()
    
    let viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        return view
    }()
    
    let myRecipesButton: ButtonHomeView = {
        let buttonHomeView = ButtonHomeView(icon: UIImage(named: "home.button.myRecipes.image".localized),
                                            title: "home.button.myRecipes.title".localized,
                                            description: "home.button.myRecipes.description".localized)
        return buttonHomeView
    }()
    
    let newRecipeButton: ButtonHomeView = {
        let buttonHomeView = ButtonHomeView(icon: UIImage(named: "home.button.newRecipe.image".localized),
                                            title: "home.button.newRecipe.title".localized,
                                            description: "home.button.newRecipe.description".localized)
        return buttonHomeView
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.gray100
        button.titleLabel?.textColor = Colors.gray800
        button.layer.cornerRadius = Metrics.medium
        button.titleLabel?.font = Typography.subHeading
        button.setTitle( "home.button.feedback".localized, for: .normal)
        button.setImage(UIImage(named: "home.button.feedback.icon".localized), for: .normal)
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
        self.addSubview(profileBackground)
        self.profileBackground.addSubview(profileImage)
        self.profileBackground.addSubview(welcomeLabel)
        self.profileBackground.addSubview(nameTextField)
        self.profileBackground.addSubview(viewBackground)
        self.viewBackground.addSubview(myRecipesButton)
        self.viewBackground.addSubview(newRecipeButton)
        self.profileBackground.addSubview(feedbackButton)
        
        self.setImageGesture()
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: self.topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.safeAreaLayoutGuide.topAnchor),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.mediumLarge),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.mediumLarge * 2),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.mediumLarge * 2),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.tiny * 2),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: profileBackground.trailingAnchor ,constant: -Metrics.mediumLarge),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: Metrics.medium),
            
            viewBackground.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: Metrics.mediumLarge),
            viewBackground.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: profileBackground.trailingAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: profileBackground.bottomAnchor),
            
            myRecipesButton.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: Metrics.hugeSmall),
            myRecipesButton.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: Metrics.mediumLarge),
            myRecipesButton.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -Metrics.mediumLarge),
            
            newRecipeButton.topAnchor.constraint(equalTo: myRecipesButton.bottomAnchor, constant: Metrics.tiny * 2),
            newRecipeButton.leadingAnchor.constraint(equalTo: myRecipesButton.leadingAnchor),
            newRecipeButton.trailingAnchor.constraint(equalTo: myRecipesButton.trailingAnchor),
            
            feedbackButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            feedbackButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            feedbackButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.smallLarge),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
    
    private func setImageGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func profileImageTapped() {
        self.delegate?.didTapProfileImage()
    }
}

#Preview {
    HomeView()
}
