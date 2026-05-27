//
//  ButtonHomeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/05/26.
//

import UIKit

class ButtonHomeView: UIView {
    
    private lazy var iconBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = Spacing.tiny
        view.clipsToBounds = false
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray100
        label.font = Typography.subHeading
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Icon.Name.arrow)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Colors.gray300
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init(icon: UIImage?, title: String, description: String) {
        super.init(frame: .zero)
        iconImageView.image = icon
        titleLabel.text = title
        descriptionLabel.text = description
        setupScreen()
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupScreen() {
        backgroundColor = Colors.gray700
        layer.cornerRadius = Spacing.small
    }
    
    private func addVisualElements() {
        addSubview(iconBackgroundView)
        iconBackgroundView.addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(arrowImageView)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            iconBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.small),
            iconBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconBackgroundView.heightAnchor.constraint(equalToConstant: Spacing.homeButtonIconBackground),
            iconBackgroundView.widthAnchor.constraint(equalToConstant: Spacing.homeButtonIconBackground),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconBackgroundView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconBackgroundView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: Spacing.huge),
            iconImageView.widthAnchor.constraint(equalToConstant: Spacing.huge),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.medium),
            titleLabel.leadingAnchor.constraint(equalTo: iconBackgroundView.trailingAnchor, constant: Spacing.regular),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.regular),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            arrowImageView.topAnchor.constraint(equalTo: topAnchor, constant: Spacing.regular),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.regular),
            arrowImageView.heightAnchor.constraint(equalToConstant: Spacing.regular),
            arrowImageView.widthAnchor.constraint(equalToConstant: Spacing.regular),
        ])
    }
}
