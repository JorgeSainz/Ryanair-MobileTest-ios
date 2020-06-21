//
//  PrimaryButton.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class PrimaryButton: UIButton {
    
    override var isEnabled: Bool {
        willSet(newValue) {
            alpha = newValue ? 1 : 0.5
        }
    }
    
    init(type: UIButton.ButtonType) {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00)
        setTitleColor(UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00), for: .normal)
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
