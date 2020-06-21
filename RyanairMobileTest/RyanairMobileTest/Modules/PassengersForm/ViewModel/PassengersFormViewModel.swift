//
//  PassengersFormViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 19/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class PassengersFormViewModel {
    
    typealias updateCompleted = (()->())
    var delegate: PassengersFormDelegate?
    
    func updatePassengers(adults: Int, teens: Int, kids: Int, completion: @escaping updateCompleted) {
        delegate?.updatePassengers(adults: adults, teens: teens, kids: kids)
        completion()
    }
}

enum PassengerType {
    case adults, teens, kids
}

protocol PassengersFormDelegate {
    func updatePassengers(adults: Int, teens: Int, kids: Int)
}
