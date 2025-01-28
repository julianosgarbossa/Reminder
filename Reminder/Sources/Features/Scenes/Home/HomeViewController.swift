//
//  HomeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let homeView: HomeView
    private let homeViewModel: HomeViewModel
    public weak var homeFlowDelegate: HomeFlowDelegate?

    init(homeView: HomeView, homeFlowDelegate: HomeFlowDelegate) {
        self.homeView = homeView
        self.homeFlowDelegate = homeFlowDelegate
        self.homeViewModel = HomeViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeView.delegate = self
        self.homeView.nameTextField.delegate = self
        self.setVisualElements()
        self.checkForExistingData()
        self.addDismissKeyboardGesture() // Adiciona o gesto para fechar o teclado
    }
    
    private func setVisualElements() {
        self.view.addSubview(homeView)
        
        self.setNavigationBar()
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.setupContentViewToBounds(contentView: homeView)
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        let logoutButton = UIBarButtonItem(image: UIImage(named: "home.button.logout.icon".localized),
                                           style: .plain,
                                           target: self,
                                           action: #selector(logoutAction))
        logoutButton.tintColor = Colors.redBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func checkForExistingData() {
        if let userName = UserDefaultMenager.loadUserName() {
            self.homeView.nameTextField.text = userName
        }
    }
    
    private func saveUserName() {
        let userName = self.homeView.nameTextField.text ?? ""
        UserDefaultMenager.saveUserName(name: userName)
    }
    
    private func addDismissKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false // Permite que outros toques continuem funcionando
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc
    private func dismissKeyboard() {
        self.view.endEditing(true) // Fecha o teclado e dispara textFieldDidEndEditing
    }
    
    @objc
    private func logoutAction() {
        UserDefaultMenager.removeUser()
        self.homeFlowDelegate?.logout()
        self.navigationController?.navigationBar.isHidden = true
    }
}

extension HomeViewController: HomeDelegate {
    func didTapProfileImage() {
        self.selectProfileImage()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private func selectProfileImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editImage = info[.editedImage] as? UIImage {
            self.homeView.profileImage.image = editImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.homeView.profileImage.image = originalImage
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.saveUserName()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.saveUserName()
    }
}
