//
//  FlightDestinationsCell.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class FlightDestinationsCell: UITableViewCell {
    
    //MARK:- OUTLETS
    lazy var departureSelector: FormField = {
        let view = FormField()
        view.informationLabel.text = "MAD"
        view.descriptionLabel.text = "De"
        return view
    }()
    
    lazy var arrivalSelector: FormField = {
        let view = FormField()
        view.informationLabel.text = ""
        view.descriptionLabel.text = "A"
        return view
    }()
    
    lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var card: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        view.layer.shadowRadius = 1
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.00).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.departureSelector, self.separator, self.arrivalSelector])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    
    //MARK:- INIT
    init() {
        super.init(style: .default, reuseIdentifier: "FlightDestinationCell")
        selectionStyle = .none
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK:- LAYOUT
    private func setUpLayout(){
        selectionStyle = .none
        backgroundColor = .clear
        setUpCard()
        setUpStack()
    }
    
    private func setUpStack(){
        card.addSubview(vStackView)
        vStackView.topAnchor.constraint(equalTo: card.topAnchor, constant: 0).isActive = true
        vStackView.leadingAnchor.constraint(equalTo: card.leadingAnchor, constant: 0).isActive = true
        vStackView.trailingAnchor.constraint(equalTo: card.trailingAnchor, constant: 0).isActive = true
        vStackView.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setUpCard(){
        addSubview(card)
        card.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
