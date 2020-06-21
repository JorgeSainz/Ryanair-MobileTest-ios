//
//  StationFormTable.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 19/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

extension StationFormViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.filteredStations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StationCell()
        let station = viewmodel.filteredStations[indexPath.row]
        cell.station = station
        cell.isSelected = (viewmodel.selectedStation == station)
        cell.isForbidden = viewmodel.forbiddenStations.contains(station)
        return cell
    }
    
}

extension StationFormViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? StationCell, cell.isForbidden == false {
            viewmodel.selectedStation = cell.station
            refreshView()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
