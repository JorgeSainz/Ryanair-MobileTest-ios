//
//  DateFormViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class DateFormViewModel {
    
    //MARK:- TODO - DONT ALLOW TO SELECT DATE PREVIOUS FROM TODAY
    
    var selectedDate: Date?
    let MAX_MONTHS: Int = 24
    
    //NOTE:- WE GET NUMBER OF DAYS FOR THE (INDEX+CURRENT MONTH)
    func getDays(from index: Int) -> Int {
        let dateComponents = DateComponents(year: getYear(from: index), month: getMonth(from: index))
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    //NOTE:- WE GET NUMBER OF MONTH GIVING AN DISTANCE
    func getMonth(from index: Int) -> Int {
        let currentDate = Date()
        var dateComponent = DateComponents()
        dateComponent.month = index
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate) ?? Date()
        let calendar = Calendar.current
        return calendar.component(.month, from: futureDate)
    }
    
    //NOTE:- WE GET NUMBER OF THE YEAR GIVING A MONTH DISTANCE
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
