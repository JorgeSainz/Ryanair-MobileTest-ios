//
//  FlightResultsViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class FlightsResultsViewModel {
    var flights: [Trip] = []
    
    var originName: String { get { flights.first?.origin ?? "" } }
    var destinationName: String { get { flights.first?.destination ?? "" } }
}
