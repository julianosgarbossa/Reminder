//
//  MyRecipeViewController.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 19/02/25.
//

import UIKit

class MyRecipeViewController: UIViewController {

    private let myRecipeView: MyRecipeView
    private weak var myRecipeFlowDelegate: MyRecipeFlowDelegate?
    private let myRecipeViewModel = MyRecipeViewModel()
    private var medicines: [Medicine] = []
    
    init(myRecipeView: MyRecipeView, myRecipeFlowDelegate: MyRecipeFlowDelegate) {
        self.myRecipeView = myRecipeView
        self.myRecipeFlowDelegate = myRecipeFlowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myRecipeView.delegate = self
        self.setVisualElements()
        self.setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
        self.myRecipeView.tableView.reloadData()
    }
    
    private func loadData() {
        medicines = self.myRecipeViewModel.fetchData()
    }
    
    private func setTableView() {
        self.myRecipeView.tableView.dataSource = self
        self.myRecipeView.tableView.delegate = self
    }
    
    private func setVisualElements() {
        self.view.addSubview(myRecipeView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        myRecipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myRecipeView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myRecipeView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myRecipeView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myRecipeView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension MyRecipeViewController: MyRecipeViewDelegate {
    func didTapBackButton() {
        self.myRecipeFlowDelegate?.popScreen()
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func didTapAddNewRecipeButton() {
        self.myRecipeFlowDelegate?.goToNewRecipe()
    }
}

extension MyRecipeViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView() // Apenas para garantir que o espaço seja respeitado
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12 // Define o espaçamento entre as seções
    }
}

extension MyRecipeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRecipeTableViewCell.identifier, for: indexPath) as? MyRecipeTableViewCell else { return UITableViewCell() }
        let medicine = medicines[indexPath.section]
        cell.configCell(title: medicine.remedy, time: medicine.time, recurrence: medicine.recurrence)
        cell.onDelete = { [weak self] in
            guard let self = self else {return}
            if let actualIndexPath = tableView.indexPath(for: cell) {
                if actualIndexPath.section < self.medicines.count {
                    self.myRecipeViewModel.deleteRecipe(id: self.medicines[actualIndexPath.section].id)
                    self.medicines.remove(at: actualIndexPath.section)
                    tableView.deleteSections(IndexSet(integer: actualIndexPath.section), with: .automatic)
                } else {
                    print("Erro ao excluir uma sessão invalida")
                }
            }
        }
        return cell
    }
}

//#Preview {
//    let myRecipeView = MyRecipeView()
//    MyRecipeViewController(myRecipeView: myRecipeView, myRecipeFlowDelegate: )
//}
