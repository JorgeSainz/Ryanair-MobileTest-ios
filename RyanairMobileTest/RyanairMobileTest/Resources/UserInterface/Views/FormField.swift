//
//  FormField.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit


class FormField: UIView {
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "De"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    lazy var valueLabel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("¿Desde donde vuelas?", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00), for: .normal)
        return button
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.text = "MAD"
        label.numberOfLines = 0
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    private lazy var formStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.valueLabel, self.informationLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.descriptionLabel, self.formStack])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    //MARK:- INIT
    init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- LAYOUT
    private func setupLayout(){
        setupStack()
    }
    
    private func setupStack(){
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
