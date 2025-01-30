//
//  ButtonHomeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 29/01/25.
//

import UIKit

class ButtonHomeView: UIView {
    
    private let iconView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = Metrics.mediumSmall / 2
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.subHeading
        label.textColor = Colors.gray100
        label.numberOfLines = 0
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "buttonHomeView.image.arrow.icon".localized)
        imageView.tintColor = Colors.gray400
        return imageView
    }()
    
    init(icon: UIImage?, title: String, description: String) {
        super.init(frame: .zero)
        self.setClass()
        self.setVisualElements()
        self.iconImageView.image = icon
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setClass() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = Colors.gray700
        self.layer.cornerRadius = Metrics.mediumSmall / 2
    }
    
    private func setVisualElements() {
        self.addSubview(iconView)
        self.iconView.addSubview(iconImageView)
        self.addSubview(arrowImageView)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.small),
            iconView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.small),
            iconView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.small),
            iconView.widthAnchor.constraint(equalToConstant: Metrics.iconViewWidth),
            iconView.heightAnchor.constraint(equalToConstant: Metrics.iconViewHeight),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: Metrics.huge),
            iconImageView.heightAnchor.constraint(equalToConstant: Metrics.huge),
            
            arrowImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.tiny * 2),
            arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(Metrics.tiny * 2)),
            arrowImageView.widthAnchor.constraint(equalToConstant: Metrics.mediumSmall),
            arrowImageView.heightAnchor.constraint(equalToConstant: Metrics.mediumSmall),
            
            titleLabel.topAnchor.constraint(equalTo: arrowImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metrics.tiny * 2),
            titleLabel.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -(Metrics.tiny * 2)),
        ])
    }
}
