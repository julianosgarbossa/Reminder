//
//  ViewController+Ext.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 23/01/25.
//

import UIKit

extension UIViewController {
    func setupContentViewToBounds(contentView: UIView) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
