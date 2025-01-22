//
//  SplashViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 17/12/24.
//

import UIKit

class SplashViewController: UIViewController {

    private let splashView: SplashView
    public weak var splashFlowDelegate: SplashFlowDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGesture()
        
        // Printa os dados do UserDefaults
        self.debugUserDefaults()
        
        // Faz a animação do logo
        self.startBreathingAnimation()
        
        self.setVisualElements()
    }
    
    init(splashView: SplashView, splashFlowDelegate: SplashFlowDelegate?) {
        self.splashView = splashView
        self.splashFlowDelegate = splashFlowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para descobrir quais chaves foram salvas no UserDefault com filtro de chave padrão "app_" aplicado
    private func debugUserDefaults() {
        let allDefaults = UserDefaults.standard.dictionaryRepresentation()
        let customKeys = allDefaults.keys.filter { $0.hasPrefix("app_") }
        
        print("Debug - UserDefaults Com Filtro Aplicado: app_")
        for key in customKeys {
            if let value = allDefaults[key] {
                // Tenta converter valores que estão em Data
                if let dataValue = value as? Data,
                   let decodedString = String(data: dataValue, encoding: .utf8) {
                    print("Chave: \(key), Valor: \(decodedString)")
                } else {
                    // Caso não consiga imprime da forma padrão
                    print("Chave: \(key), Valor: \(value)")
                }
            }
        }
    }
    
    private func decideNavigationFlow() {
        if let user = UserDefaultMenager.loadUser(), user.isUserSaved {
            splashFlowDelegate?.navigateToHome()
        } else {
            self.showLogin()
        }
    }
    
    private func setVisualElements() {
        self.view.addSubview(splashView)
        self.navigationController?.navigationBar.isHidden = false
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        splashView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            splashView.topAnchor.constraint(equalTo: self.view.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            splashView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            splashView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLogin))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLogin() {
        animateLogoUp()
        self.splashFlowDelegate?.openLogin()
    }
}

// MARK: Animations
extension SplashViewController {
    private func startBreathingAnimation() {
        // Reseta a transformação antes de aplicar a animação
        splashView.logoImageView.transform = .identity
        UIView.animate(withDuration: 1.5, delay: 0.0, animations: {
            self.splashView.logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: { _ in
            // Ciclo de desição para saber se o usuário vai para tela de login ou para a tela home
            self.decideNavigationFlow()
        })
    }
    
    private func animateLogoUp() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [.curveEaseOut], animations: {
            let translateY = -self.view.frame.height * 0.30 // Calcula 30% da altura da tela
            self.splashView.logoImageView.transform = self.splashView.logoImageView.transform.translatedBy(x: 0, y: translateY)
        })
    }
}
