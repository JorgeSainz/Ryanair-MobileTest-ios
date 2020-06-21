//
//  StationCell.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 19/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {
    
    //MARK:- VARIABLES
    override var isSelected: Bool { didSet(newValue) { setActive(isActive: newValue)} }
    var isForbidden: Bool = false { willSet(newValue) { setForbidden(newValue) } }
    var station: Station? = nil { willSet(newValue) { updateData(newValue) } }
    
    //MARK:- OUTLETS
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Madrid"
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.text = "España"
        label.textColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    private lazy var codeLabel: UILabel = {
        let label = UILabel()
        label.text = "MAD"
        label.textAlignment = .right
        label.textColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.cityLabel, self.countryLabel])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 3
        return stack
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.vStackView, self.codeLabel])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 10
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    
    //MARK:- INIT
    init() {
        super.init(style: .default, reuseIdentifier: "CalendarCell")
        setUpLayout()
        separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateData(_ station: Station?){
        guard let stn = station else { return }
        cityLabel.text = stn.name
        countryLabel.text = stn.countryName
        codeLabel.text = stn.code
    }


    //MARK:- LAYOUT
    private func setUpLayout(){
        selectionStyle = .none
        setUpStack()
    }
    
    private func setUpStack(){
        addSubview(hStackView)
        hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    //MARK:- AUX FUNCTIONS
    private func setActive(isActive: Bool){
        if isActive { backgroundColor = UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00)}
        else if isForbidden { setForbidden(true) }
        else { backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) }
    }
    
    private func setForbidden(_ forbidden: Bool){
        if forbidden == true {
            cityLabel.textColor = UIColor(red: 0.70, green: 0.75, blue: 0.76, alpha: 1.00)
            countryLabel.textColor = UIColor(red: 0.70, green: 0.75, blue: 0.76, alpha: 1.00)
            codeLabel.textColor = UIColor(red: 0.70, green: 0.75, blue: 0.76, alpha: 1.00)
            backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
        }
    }
    
}



