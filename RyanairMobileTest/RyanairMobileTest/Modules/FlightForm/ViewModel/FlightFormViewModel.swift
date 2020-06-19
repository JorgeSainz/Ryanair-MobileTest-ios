//
//  FlightFormViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class FlightFormViewModel {
    
    //MARK:- VARIABLES
    var origin: Station?
    var destiny: Station?
    var departureDate: Date?
    var adults: Int? = 1
    var teens: Int?
    var kids: Int?
    
    //MARK:- VIEW MODEL VARIABLES
    private var totalPassengers: Int { get { (adults ?? 0) + (teens ?? 0) + (kids ?? 0) } }
    var departureInformation: String { get { getDepartureDate() } }
    var passengersInformation: String { get { getPassengersInformation() }}
    var canSearchFlights: Bool { get { checkIfCanSearchFlights() }}
    
    
    
    
    //MARK:- AUX FUNCTIONS
    private func checkIfCanSearchFlights() -> Bool{
        return origin != nil && destiny != nil && departureDate != nil && totalPassengers > 0
    }
    
    private func getDepartureDate() -> String{
        if let departure = departureDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMMM, yyyy"
            return dateFormatter.string(from: departure).capitalized
        }
        return "Elige fecha"
    }
    
    private func getPassengersInformation() -> String {
        var information = ""
        guard let adt = adults, let tn = teens , let kd = kids else { return "Selecciona pasajeros" }
        if adt > 0 { information += "\(adt) Adulto\(adt > 1 ? "s":"") "  }
        if tn > 0 { information += ", \(tn) Adolescente\(adt > 1 ? "s":"") "  }
        if kd > 0 { information += ", \(kd) Niño\(kd > 1 ? "s":"") "  }
        return information
    }
    
}


extension FlightFormViewModel: DateFormDelegate {
    func updateDepartureDate(_ date: Date) {
        self.departureDate = date
    }
}

extension FlightFormViewModel: PassengersFormDelegate {
    func updatePassengers(adults: Int, teens: Int, kids: Int) {
        self.adults = adults
        self.teens = teens
        self.kids = kids
    }
    
    
}
