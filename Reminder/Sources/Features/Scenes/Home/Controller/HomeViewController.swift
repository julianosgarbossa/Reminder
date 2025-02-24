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
    private weak var homeFlowDelegate: HomeFlowDelegate?

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
        self.setActionNewRecipe()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setNavigationBar()
    }
    
    private func setVisualElements() {
        self.view.addSubview(homeView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        self.setupContentViewToBounds(contentView: homeView)
    }
    
    private func setActionNewRecipe() {
        self.homeView.newRecipeButton.tapAction = { [weak self] in
            self?.didTapNewRecipeButton()
        }
        
        self.homeView.myRecipesButton.tapAction = { [weak self] in
            self?.didTapMyRecipeButton()
        }
    }
    
    private func setNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
        let logoutButton = UIBarButtonItem(image: UIImage(named: "home.button.logout.icon".localized),
                                           style: .plain,
                                           target: self,
                                           action: #selector(logoutAction))
        logoutButton.tintColor = Colors.redBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func checkForExistingData() {
        // Verifica se o usuário está salvo
        if UserDefaultMenager.loadUser() != nil {
            self.homeView.nameTextField.text = UserDefaultMenager.loadUserName()
        }
        
        // Verifica se a imagem de perfil está salva
        if let saveImage = UserDefaultMenager.loadProfileImage() {
            self.homeView.profileImage.image = saveImage
        } else {
            self.homeView.profileImage.image = UIImage(named: "home.image.avatar".localized)
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
        self.homeViewModel.logoutUser()
        self.homeFlowDelegate?.logout()
    }
}

extension HomeViewController: HomeDelegate {
    func didTapProfileImage() {
        self.selectProfileImage()
    }
    
    func didTapMyRecipeButton() {
        homeFlowDelegate?.navigateToMyRecipe()
    }
    
    func didTapNewRecipeButton() {
        homeFlowDelegate?.navigateToNewRecipe()
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
            UserDefaultMenager.saveProfileImage(image: editImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            self.homeView.profileImage.image = originalImage
            UserDefaultMenager.saveProfileImage(image: originalImage)
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
