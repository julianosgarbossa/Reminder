//
//  SplashScreen.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 18/05/26.
//

import UIKit

class SplashScreen: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.primaryRedBase
        addVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addVisualElements() {
        
        addSubview(logoImageView)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
