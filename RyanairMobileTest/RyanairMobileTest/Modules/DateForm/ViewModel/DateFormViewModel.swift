//
//  DateFormViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

protocol DateFormDelegate {
    func updateDepartureDate(_ date: Date)
}

class DateFormViewModel {
    
    typealias updateCompleted = (()->())

    //MARK:- VARIABLES
    var selectedDate: Date?
    let MAX_MONTHS: Int = 24
    var delegate: DateFormDelegate?
    
    
    func updateDepartureDate(completion: @escaping updateCompleted) {
        if let departure = selectedDate {
            delegate?.updateDepartureDate(departure)
            completion()
        }
    }
    
    //MARK:- CALENDAR AUX FUNCTIONS TO TABLE
    /// Returns numbers of day in given month
    /// - Parameters
    ///     - index: Distance in months from current month
    func getDays(from index: Int) -> Int {
        let dateComponents = DateComponents(year: getYear(from: index), month: getMonth(from: index))
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    /// Returns month number distancing an lenght index
    /// - Parameters
    ///     - index: Distance in months from current month
    func getMonth(from index: Int) -> Int {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.month = index
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) ?? Date()
        let calendar = Calendar.current
        return calendar.component(.month, from: futureDate)
    }
    
    /// Returns year of a date distancing a given index
    /// - Parameters
    ///     - index: Distance in months from current month
    func getYear(from index: Int) -> Int {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.month = index
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) ?? Date()
        let calendar = Calendar.current
        return calendar.component(.year, from: futureDate)
    }
    
    func getMonthYearLabel(from index: Int) -> String {
        let month = getMonth(from: index)
        let year = getYear(from: index)
        let date = Date.getDateFrom(day: 1, month: month, year: year)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM - yyyy"
        return dateFormatter.string(from: date).capitalized
    }
}
