//
//  DateHeader.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class DateHeader: UIView {
    
    //MARK:- OUTLETS
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "MMMM - yyyy"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.dateLabel])
        stack.axis = .horizontal
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
        super.init(frame: .zero)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setSelection(to status: Bool){
        backgroundColor = status ? UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00) : .clear
    }
    //MARK:- LAYOUT
    private func setUpLayout(){
        backgroundColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
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
