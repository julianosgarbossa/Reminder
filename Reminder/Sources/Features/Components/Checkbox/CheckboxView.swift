//
//  CheckboxView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 10/02/25.
//

import UIKit

class CheckboxView: UIView {
    
    private let checkbox: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "newRecipe.checkboxFalse.image".localized)
        configuration.baseForegroundColor = Colors.gray400
        configuration.imagePadding = 0
        configuration.imagePlacement = .all
        configuration.contentInsets = .zero
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.input
        label.textColor = Colors.gray200
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        self.setVisualElements()
        self.titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        self.addSubview(checkbox)
        self.addSubview(titleLabel)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            checkbox.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            checkbox.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            checkbox.heightAnchor.constraint(equalToConstant: Metrics.medium),
            checkbox.widthAnchor.constraint(equalToConstant: Metrics.medium),
            
            titleLabel.topAnchor.constraint(equalTo: checkbox.topAnchor, constant: Metrics.inputBorder * 2),
            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: Metrics.small)
        ])
    }
}

#Preview {
    CheckboxView(title: "Tomar agora")
}
