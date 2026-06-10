//
//  NewPrescriptionViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 03/06/26.
//

import UIKit

protocol NewPrescriptionCoordinatorDelegate: AnyObject {
    func backButton()
}

class NewPrescriptionViewController: UIViewController {
    
    private weak var delegate: NewPrescriptionCoordinatorDelegate?
    private var screen: NewPrescriptionScreen
    private let viewModel: NewPrescriptionViewModel = NewPrescriptionViewModel()
    
    init(screen: NewPrescriptionScreen, delegate: NewPrescriptionCoordinatorDelegate) {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        configDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    
    private func configDelegates() {
        screen.delegate(delegate: self)
    }
}

extension NewPrescriptionViewController: NewPrescriptionScreenDelegate {
    func didTapBackButton() {
        delegate?.backButton()
    }
    
    func didTapAddButton() {
        print("Nova receita adicionada!")
    }

}
