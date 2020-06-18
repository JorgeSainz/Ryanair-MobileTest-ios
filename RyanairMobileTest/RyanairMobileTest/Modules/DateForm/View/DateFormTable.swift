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
        return viewModel.MAX_MONTHS
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let daysAtMonth = viewModel.getDays(from: section)
        return daysAtMonth
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CalendarCell(day: indexPath.row + 1, month: viewModel.getMonth(from: indexPath.section), year: viewModel.getYear(from: indexPath.section))
        cell.isSelected = viewModel.selectedDate == cell.cellDate
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DateHeader()
        header.dateLabel.text = viewModel.getMonthYearLabel(from: section)
        return header
    }
    
}

extension DateFormViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CalendarCell {
            viewModel.selectedDate = cell.cellDate
            refreshView()
        }
    }
}
