//
//  PassengerSelectorCell.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class PassengerPickerCell: UITableViewCell {
    
    //MARK:- OUTLETS
    lazy var picker: PassengerPicker = {
        let view = PassengerPicker()
        view.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return view
    }()
    
    lazy var passengerLabel: UILabel = {
        let label = UILabel()
        label.text = "Adultos"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Mayores de 16 años"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()

    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.passengerLabel, self.descriptionLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.vStackView, self.picker])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 10, right: 15)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    //MARK:- INIT
    init(passenger: PassengerType) {
        super.init(style: .default, reuseIdentifier: "PassengerPickerCell")
        selectionStyle = .none
        setupLayout()
        setupCell(for: passenger)
        picker.passengerType = passenger
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- LAYOUT
    private func setupLayout(){
        selectionStyle = .none
        backgroundColor = .clear
        setupStack()
    }
    
    private func setupStack(){
        addSubview(hStackView)
        hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupCell(for passsenger: PassengerType){
        switch passsenger {
        case .adults:
            passengerLabel.text = "Adultos"
            descriptionLabel.text = "Mayores de 16 años"
        case .teens:
            passengerLabel.text = "Adolescentes"
            descriptionLabel.text = "De 12 a 15 años"
        case .kids:
            passengerLabel.text = "Niños"
            descriptionLabel.text = "2-11 años"
        }
    }
}
