//
//  DateFormTable.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

extension DateFormViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel.MAX_MONTHS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let daysAtMonth = viewmodel.getDays(from: section)
        return daysAtMonth
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CalendarCell(day: indexPath.row + 1, month: viewmodel.getMonth(from: indexPath.section), year: viewmodel.getYear(from: indexPath.section))
        cell.isSelected = viewmodel.selectedDate == cell.cellDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DateHeader()
        header.dateLabel.text = viewmodel.getMonthYearLabel(from: section)
        return header
    }
    
}

extension DateFormViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CalendarCell, cell.status != .invalid {
            viewmodel.selectedDate = cell.cellDate
            refreshView()
        }
    }
}
