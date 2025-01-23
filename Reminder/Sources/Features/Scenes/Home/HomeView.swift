//
//  HomeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import UIKit

class HomeView: UIView {
    
    let profileBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "home.image.avatar".localized)
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray200
        label.font = Typography.label
        label.text = "home.label.welcome".localized
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray100
        label.font = Typography.heading
        label.text = "home.label.name".localized
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
        self.profileBackground.addSubview(nameLabel)
        self.profileBackground.addSubview(viewBackground)
        self.profileBackground.addSubview(feedbackButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            profileBackground.topAnchor.constraint(equalTo: self.topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.safeAreaLayoutGuide.topAnchor, constant: Metrics.mediumLarge),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.mediumLarge),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.mediumLarge * 2),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.mediumLarge * 2),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.tiny * 2),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: profileBackground.trailingAnchor ,constant: -Metrics.mediumLarge),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            viewBackground.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Metrics.mediumLarge),
            viewBackground.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: profileBackground.trailingAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: profileBackground.bottomAnchor),
            
            feedbackButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            feedbackButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            feedbackButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.smallLarge),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
        ])
    }
}
