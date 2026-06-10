//
//  NewPrescriptionScreen.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 03/06/26.
//

import UIKit

protocol NewPrescriptionScreenDelegate: AnyObject {
    func didTapBackButton()
    func didTapAddButton()
}

class NewPrescriptionScreen: UIView {
    
    private weak var delegate: NewPrescriptionScreenDelegate?
    
    func delegate(delegate: NewPrescriptionScreenDelegate) {
        self.delegate = delegate
    }
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(Icon.image(named: Icon.Name.back), for: .normal)
        button.tintColor = Colors.gray100
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.NewPrescription.title
        label.textColor = Colors.primaryRedBase
        label.font = Typography.heading
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.NewPrescription.description
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var remedyInput: InputView = {
        let input = InputView(title: "Remédio", placeholder: "Nome do remédio")
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private lazy var timeInput: InputView = {
        let input = InputView(title: "Horário", placeholder: "00:00")
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private lazy var recurrenceInput: InputView = {
        let input = InputView(title: "Recorrência", placeholder: "De 8 em 8 horas")
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    private lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var title = AttributedString(Localizable.NewPrescription.buttonTitle)
        title.font = Typography.subHeading
        title.foregroundColor = Colors.gray800
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.image = Icon.image(named: Icon.Name.plus, size: CGSize(width: 25, height: 25))
        config.imagePlacement = .leading
        config.imagePadding = Spacing.tiny
        config.baseForegroundColor = Colors.gray800
        config.baseBackgroundColor = Colors.primaryRedBase
        config.cornerStyle = .capsule
        button.configuration = config
        button.tintColor = Colors.gray800
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedBackButton(_ sender: UIButton) {
        delegate?.didTapBackButton()
    }
    
    @objc
    private func tappedAddButton(_ sender: UIButton) {
        delegate?.didTapAddButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen() {
        backgroundColor = Colors.gray800
    }
    
    private func addVisualElements() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(addButton)
        addSubview(remedyInput)
        addSubview(timeInput)
        addSubview(recurrenceInput)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Spacing.medium),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            backButton.heightAnchor.constraint(equalToConstant: Spacing.medium),
            backButton.widthAnchor.constraint(equalToConstant: Spacing.medium),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Spacing.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Spacing.medium),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Spacing.medium),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.tiny),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Spacing.large),
            remedyInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            remedyInput.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Spacing.medium),
            timeInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeInput.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Spacing.medium),
            recurrenceInput.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            recurrenceInput.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Spacing.medium),
            addButton.heightAnchor.constraint(equalToConstant: Spacing.huge),
        ])
    }
}
