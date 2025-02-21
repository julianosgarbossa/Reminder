//
//  MyRecipeTableViewCell.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 20/02/25.
//

import UIKit

class MyRecipeTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: MyRecipeTableViewCell.self)
    
    var onDelete: (() -> Void)?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.subHeading
        label.textColor = Colors.gray200
        return label
    }()
    
    lazy var trashButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "trash"), for: .normal)
        button.addTarget(self, action: #selector(trashButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let timeBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = Metrics.small
        return view
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.tag
        label.textColor = Colors.gray100
        return label
    }()
    
    let timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "clock")
        return imageView
    }()
    
    let recurrenceBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray500
        view.layer.cornerRadius = Metrics.small
        return view
    }()
    
    let recurrenceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.tag
        label.textColor = Colors.gray100
        return label
    }()
    
    let recurrenceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "repeat")
        return imageView
    }()
    
    @objc
    private func trashButtonTapped() {
        self.onDelete?()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = Colors.gray700
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = Metrics.small
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(title: String, time: String, recurrence: String) {
        self.titleLabel.text = title
        self.timeLabel.text = time
        self.recurrenceLabel.text = recurrence
    }
    
    private func setVisualElements() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(trashButton)
        contentView.addSubview(timeBackgroundView)
        contentView.addSubview(recurrenceBackgroundView)
        
        timeBackgroundView.addSubview(timeLabel)
        timeBackgroundView.addSubview(timeImageView)
   
        recurrenceBackgroundView.addSubview(recurrenceLabel)
        recurrenceBackgroundView.addSubview(recurrenceImageView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Metrics.tiny * 2),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metrics.tiny * 2),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -(Metrics.mediumLarge + 3)),
            
            trashButton.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            trashButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Metrics.tiny * 2),
            trashButton.heightAnchor.constraint(equalToConstant: Metrics.tiny * 2),
            trashButton.widthAnchor.constraint(equalToConstant: Metrics.tiny * 2),
            
            timeBackgroundView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            timeBackgroundView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            timeBackgroundView.heightAnchor.constraint(equalToConstant: Metrics.medium + 4),
            timeBackgroundView.widthAnchor.constraint(equalToConstant: Metrics.iconViewWidth - 6),
            
            timeLabel.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: -Metrics.small),
            
            timeImageView.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            timeImageView.leadingAnchor.constraint(equalTo: timeBackgroundView.leadingAnchor, constant: Metrics.tiny),
            timeImageView.heightAnchor.constraint(equalToConstant: Metrics.smallLarge),
            timeImageView.widthAnchor.constraint(equalToConstant: Metrics.smallLarge),
            
            recurrenceBackgroundView.centerYAnchor.constraint(equalTo: timeBackgroundView.centerYAnchor),
            recurrenceBackgroundView.leadingAnchor.constraint(equalTo: timeBackgroundView.trailingAnchor, constant: Metrics.tiny),
            recurrenceBackgroundView.heightAnchor.constraint(equalToConstant: 28),
            
            recurrenceImageView.centerYAnchor.constraint(equalTo: recurrenceBackgroundView.centerYAnchor),
            recurrenceImageView.leadingAnchor.constraint(equalTo: recurrenceBackgroundView.leadingAnchor, constant: Metrics.tiny),
            recurrenceImageView.heightAnchor.constraint(equalTo: timeImageView.heightAnchor),
            recurrenceImageView.widthAnchor.constraint(equalTo: timeImageView.widthAnchor),
            
            recurrenceLabel.centerYAnchor.constraint(equalTo: recurrenceBackgroundView.centerYAnchor),
            recurrenceLabel.leadingAnchor.constraint(equalTo: recurrenceImageView.trailingAnchor, constant: Metrics.tiny),
            recurrenceLabel.trailingAnchor.constraint(equalTo: recurrenceBackgroundView.trailingAnchor, constant: -Metrics.small)
        ])
    }
}

#Preview {
    MyRecipeTableViewCell()
}


