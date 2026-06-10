//
//  InputView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 03/06/26.
//

import UIKit

class InputView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray100
        label.font = Typography.label
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = Colors.gray200
        textField.font = Typography.input
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        // TODO - Target
        return textField
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        addVisualElements()
        titleLabel.text = title
        inputTextField.placeholder = placeholder
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        addSubview(titleLabel)
        addSubview(inputTextField)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            inputTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.small),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            inputTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: Spacing.huge)
        ])
    }
    
    func getText() -> String? {
        return inputTextField.text
    }
}
