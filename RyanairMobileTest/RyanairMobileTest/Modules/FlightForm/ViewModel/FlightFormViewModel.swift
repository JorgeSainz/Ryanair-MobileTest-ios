//
//  FlightFormViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class FlightFormViewModel {
    
    var origin: Station?
    var destiny: Station?
    var departureDate: Date?
    var passangers: Int?
    var canSearchFlights: Bool { get { checkIfCanSearchFlights() }}
    
    
    private func checkIfCanSearchFlights() -> Bool{
        return origin != nil && destiny != nil && departureDate != nil && passangers != nil
    }
    
}
