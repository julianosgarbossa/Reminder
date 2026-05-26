//
//  HomeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 22/05/26.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func logout()
}

class HomeViewController: UIViewController {

    private weak var delegate: HomeCoordinatorDelegate?
    private var screen: HomeScreen
    private let viewModel: HomeViewModel = HomeViewModel()
    
    init(screen: HomeScreen, delegate: HomeCoordinatorDelegate) {
        self.screen = screen
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = screen
    }
    
    @objc
    private func tappedLogoutButton(_ sender: UIBarButtonItem) {
        viewModel.logout()
        delegate?.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configDelegates()
        loadUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configDelegates() {
        screen.configDelegate(delegate: self)
        screen.configTextFieldDelegate(delegate: self)
    }
    
    private func setupNavigationBar() {
        let logoutButton = UIBarButtonItem(image: Icon.image(named: Icon.Name.logOut), style: .plain, target: self, action: #selector(tappedLogoutButton))
        logoutButton.tintColor = Colors.primaryRedBase
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    private func loadUserData() {
        screen.configureUserName(viewModel.loadUserName())
    }
}

extension HomeViewController: HomeScreenDelegate {
    func didTapUserProfileImageView() {
        selectProfileImage()
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            screen.profileImageView.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            screen.profileImageView.image = originalImage
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
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.updateUserName(textField.text)
    }
}
