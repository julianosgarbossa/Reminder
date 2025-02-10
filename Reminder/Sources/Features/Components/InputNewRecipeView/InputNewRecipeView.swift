//
//  InputNewRecipeView.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 10/02/25.
//

import UIKit

class InputNewRecipeView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.label
        label.textColor = Colors.gray100
        return label
    }()
    
    private let inputTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = Typography.input
        textField.layer.borderWidth = Metrics.inputBorder
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.layer.cornerRadius = Metrics.tiny
        textField.textColor = Colors.gray200
        textField.backgroundColor = Colors.gray800
        textField.keyboardType = .default
        textField.autocapitalizationType = .none
        return textField
    }()
    
    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.inputTextField.placeholder = placeholder
        self.configPlaceHolder(placeholder: placeholder)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getText() -> String {
        return inputTextField.text ?? ""
    }
    
    private func configPlaceHolder(placeholder: String) {
        inputTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200])
    }
    
    private func setVisualElements() {
        self.addSubview(titleLabel)
        self.addSubview(inputTextField)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            inputTextField.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: Metrics.small),
            inputTextField.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            inputTextField.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor),
            inputTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize)
    
        ])
    }
}

#Preview {
    InputNewRecipeView(title: "Remédio", placeholder: "Nome do remédio")
}
