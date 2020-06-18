//
//  CalendarCell.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class CalendarCell: UITableViewCell {
    
    let cellDate: Date
    override var isSelected: Bool { didSet(newValue) { setSelection(to: newValue)} }
    //MARK:- OUTLETS
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = getStringFromDate()
        label.textColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
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
    init(day: Int, month: Int, year: Int) {
        self.cellDate = Date.getDateFrom(day: day, month: month, year: year)
        super.init(style: .default, reuseIdentifier: "FlightDestinationCell")
        selectionStyle = .none
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd - EEEE"
        return dateFormatter.string(from: self.cellDate).capitalized
    }
    
    private func setSelection(to status: Bool){
        backgroundColor = status ? UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00) : .clear
    }
    //MARK:- LAYOUT
    private func setUpLayout(){
        selectionStyle = .none
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


