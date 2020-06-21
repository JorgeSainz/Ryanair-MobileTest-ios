//
//  FlightFormViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class FlightFormViewModel {
    
    typealias handler = ((Result<[Trip], Error>) -> Void)
    
    //MARK:- VARIABLES
    private var connection = ConnectionManager()
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
    
    
    func searchFlights(completion: @escaping handler){
        let endpoint = configuredFlightsUrl()
        
        connection.get(url: endpoint) { (result: Result<Trips,Error>) in
            switch result {
            case .success(let trips):
                DispatchQueue.main.async {
                    completion(.success(trips.trips ?? []))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    
    
    //MARK:- AUX FUNCTIONS
    private func configuredFlightsUrl() -> URL {
        let endpoint = URL.Endpoints.flights
        guard var urlComponents = URLComponents(url: endpoint, resolvingAgainstBaseURL: true) else { return endpoint }
        
        let originQuery = URLQueryItem(name: "origin", value: origin?.code)
        let destinationQuery = URLQueryItem(name: "destination", value: destiny?.code)
        let dateoutQuery = URLQueryItem(name: "dateout", value: getDepartureQueryDate())
        let adultsQuery = URLQueryItem(name: "adt", value: "\(adults ?? 0)")
        let teensQuery = URLQueryItem(name: "teen", value: "\(teens ?? 0)")
        let childrenQuery = URLQueryItem(name: "chd", value: "\(kids ?? 0)")
        
        urlComponents.queryItems = [ originQuery, destinationQuery, dateoutQuery, adultsQuery, teensQuery, childrenQuery ]
        
        return urlComponents.url ?? endpoint
        
    }
    
    private func getDepartureQueryDate() -> String? {
        if let departure = departureDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: departure).capitalized
        }
        return nil
    }
    
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
        if adults == nil && teens == nil && kids == nil { return "Selecciona pasajeros" }
        if let adt = adults, adt > 0 { information += "\(adt) Adulto\(adt > 1 ? "s":"") " }
        if let tn = teens, tn > 0 { information += ", \(tn) Adolescente\(tn > 1 ? "s":"") " }
        if let kd = kids, kd > 0 { information += ", \(kd) Niño\(kd > 1 ? "s":"") " }
        return information
    }
}

//MARK:- FORM DELEGATES
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

extension FlightFormViewModel: StationFormDelegate {
    func updateStation(_ station: Station, type: StationType) {
        if type == .origin { origin = station }
        if type == .destination { destiny = station }
    }
}
