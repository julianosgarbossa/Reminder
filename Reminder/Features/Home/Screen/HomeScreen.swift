//
//  HomeScreen.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import UIKit

protocol HomeScreenDelegate: AnyObject {
    func didTapUserProfileImageView()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenDelegate?
    
    func configDelegate(delegate: HomeScreenDelegate) {
        self.delegate = delegate
    }
    
    private lazy var profileBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metrics.large
        imageView.image = UIImage(named: Image.Name.userPhotoDefault)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Localizable.Home.welcome
        label.textColor = Colors.gray200
        label.font = Typography.input
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = Localizable.Home.namePlaceholder
        textfield.textColor = Colors.gray100
        textfield.font = Typography.heading
        textfield.returnKeyType = .done
        textfield.textAlignment = .left
        return textfield
    }()
    
    private lazy var contentBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var feedbackButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        var title = AttributedString(Localizable.Home.buttonTitle)
        title.font = Typography.subHeading
        title.foregroundColor = Colors.gray800
        var config = UIButton.Configuration.filled()
        config.attributedTitle = title
        config.image = Icon.image(named: Icon.Name.star, size: CGSize(width: 25, height: 25))
        config.imagePlacement = .leading
        config.imagePadding = Metrics.tiny
        config.baseForegroundColor = Colors.gray800
        config.baseBackgroundColor = Colors.gray100
        config.cornerStyle = .capsule
        button.configuration = config
        button.tintColor = Colors.gray800
        button.semanticContentAttribute = .forceLeftToRight
        button.addTarget(self, action: #selector(tappedFeecbackButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func tappedFeecbackButton(_ sender: UIButton) {
        print("Avaliar")
    }
    
    @objc
    private func tappadUserProfileImageView(_ sender: UIImageView) {
        delegate?.didTapUserProfileImageView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addVisualElements()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        
        addSubview(profileBackgroundView)
        profileBackgroundView.addSubview(profileImageView)
        profileBackgroundView.addSubview(welcomeLabel)
        profileBackgroundView.addSubview(nameTextField)
        
        addSubview(contentBackgroundView)
        contentBackgroundView.addSubview(feedbackButton)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            profileBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            profileBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackgroundView.heightAnchor.constraint(equalToConstant: Metrics.homeProfileHeader),
            
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            profileImageView.widthAnchor.constraint(equalToConstant: Metrics.giant),
            profileImageView.heightAnchor.constraint(equalToConstant: Metrics.giant),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            contentBackgroundView.topAnchor.constraint(equalTo: profileBackgroundView.bottomAnchor, constant: -Metrics.large),
            contentBackgroundView.leadingAnchor.constraint(equalTo: profileBackgroundView.leadingAnchor),
            contentBackgroundView.trailingAnchor.constraint(equalTo: profileBackgroundView.trailingAnchor),
            contentBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedbackButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            feedbackButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            feedbackButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -Metrics.medium),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.huge),
        ])
    }
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappadUserProfileImageView))
        profileImageView.addGestureRecognizer(tap)
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
    }
    
    func configureUserName(user: User?) {
        nameTextField.text = user?.name
        profileImageView.image = user?.profileImageData?.toUIImage() ?? UIImage(named: Image.Name.userPhotoDefault)
    }
}
