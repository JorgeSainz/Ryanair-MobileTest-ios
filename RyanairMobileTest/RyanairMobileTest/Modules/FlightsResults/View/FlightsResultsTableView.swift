//
//  FlightsResultsTableView.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

extension FlightsResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.flights.first?.dates?.first?.flights.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FlightCell()
        if let tripData = viewmodel.flights.first, let flightData = viewmodel.flights.first?.dates?.first?.flights[indexPath.row] {
            cell.updateData(trip: tripData, flight: flightData)
        }
        return cell
    }
    
}

extension FlightsResultsViewController: UITableViewDelegate {}
