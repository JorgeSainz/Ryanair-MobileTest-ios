//
//  FlightCell.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class FlightCell: UITableViewCell {
    
    //MARK:- VARIABLES
    let viewmodel = FlightCellViewModel()
    
    //MARK:- OUTLETS
    lazy var originHourLabel: UILabel = {
        let label = UILabel()
        label.text = "06:40"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    lazy var originCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "MAD"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    private lazy var originStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.originHourLabel, self.originCodeLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var destinationHourLabel: UILabel = {
        let label = UILabel()
        label.text = "08:00"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    lazy var destinationCodeLabel: UILabel = {
        let label = UILabel()
        label.text = "IBZ"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    private lazy var destinationStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.destinationHourLabel, self.destinationCodeLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 1
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var flightDateLabel: UILabel = {
        let label = UILabel()
        label.text = "sáb 4 jul"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()

    
    lazy var flightNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "FR 5354"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    private lazy var flightStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.flightDateLabel, self.flightNumberLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.originStack, self.flightStack, self.destinationStack])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 0
        return stack
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "83.25 €"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1.00)
        return label
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.hStackView, self.separator, self.priceLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 5
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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


    
    //MARK:- INIT
    init() {
        super.init(style: .default, reuseIdentifier: "FlightDestinationCell")
        selectionStyle = .none
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateData(trip: Trip, flight: Trip.Flight){
        viewmodel.tripData = trip
        viewmodel.flightData = flight
        
        originHourLabel.text = viewmodel.departureHour
        originCodeLabel.text = viewmodel.departureCode
        
        destinationHourLabel.text = viewmodel.destinationHour
        destinationCodeLabel.text = viewmodel.destinationCode
        
        flightDateLabel.text = viewmodel.date
        flightNumberLabel.text = viewmodel.number
        priceLabel.text = viewmodel.price
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
        card.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        card.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        card.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }

}
