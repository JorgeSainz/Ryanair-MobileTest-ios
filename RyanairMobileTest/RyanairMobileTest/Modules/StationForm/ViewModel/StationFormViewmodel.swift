//
//  StationFormViewmodel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

protocol StationFormDelegate {
    func updateStation(_ station: Station, type: StationType)
}

enum StationType {
    case origin, destination
}

class StationFormViewModel {
    
    typealias handler = (Result<Void, Error>) -> Void
    typealias updateCompleted = (()->())
    
    var stations: [Station] = []
    var filteredStations: [Station] = []
    var selectedStation: Station?
    var forbiddenStations: [Station] = []
    
    var delegate: StationFormDelegate?
    var type: StationType?
    
    private let connection = ConnectionManager()
    
    func fetchStations(completion: @escaping handler){
        connection.get(url: URL.Endpoints.stations) { [weak self] (result: Result<Stations, Error>) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                switch result {
                    case .success(let data):
                        strongSelf.stations = data.stations.sorted(by: {$0.countryName < $1.countryName})
                        strongSelf.filteredStations = strongSelf.stations
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            }
    }
    
    func search(_ query: String) {
        if query.isEmpty {
            filteredStations = stations
            return
        }
        filteredStations = stations.filter({ (station) -> Bool in
            return station.name.lowercased().contains(query.lowercased()) || station.code.lowercased().contains(query.lowercased())
        })
    }
    
    func updateStation(completion: @escaping updateCompleted) {
        guard let stat = selectedStation, let statType = type else { return }
        delegate?.updateStation(stat, type: statType)
        completion()
    }

}

