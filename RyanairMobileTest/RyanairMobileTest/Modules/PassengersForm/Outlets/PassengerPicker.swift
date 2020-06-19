//
//  PassengerNumberView.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

protocol PassengerPickerDelegate {
    func showAlertMaxPassengers(_ type: PassengerType)
}

class PassengerPicker: UIView {
    
    var delegate: PassengerPickerDelegate?
    var value: Int = 0 {
        willSet(newValue) { self.passengerLabel.text = "\(newValue)" }
    }
    var passengerType: PassengerType? {
        willSet(newValue) { if (newValue == .adults) { value = 1 } }
    }
    private let max_value = 6
    private var min_value: Int { get { return (self.passengerType == .adults ? 1 : 0) } }
    
    //MARK:- OUTLETS
    lazy var restButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(removePassenger), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(addPassenger), for: .touchUpInside)
        return button
    }()
    
    lazy var passengerLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()

    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.restButton, self.passengerLabel, self.addButton])
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
    init() {
        super.init(frame: .zero)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- UI ACTIONS
    @objc func addPassenger(){
        if value < max_value { value += 1 }
        else { delegate?.showAlertMaxPassengers(passengerType ?? .adults) }
    }
    
    @objc func removePassenger(){
        if value > min_value { value -= 1}
    }
    
    //MARK:- LAYOUT
    private func setUpLayout(){
        backgroundColor = .clear
        setUpStack()
    }
    
    private func setUpStack(){
        addSubview(hStackView)
        hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
