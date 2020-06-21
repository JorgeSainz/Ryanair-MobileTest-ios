//
//  FlightCellViewModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 21/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

class FlightCellViewModel {
    
    //MARK:- VARIABLES
    //Data
    var tripData: Trip?
    var flightData: Trip.Flight?
    
    //Origin
    var departureHour: String { get { getFlightDepartureHour() } }
    var departureCode: String { get { getFlightDepartureCode() } }
    
    //Destination
    var destinationHour: String { get { getFlightDestinationHour() } }
    var destinationCode: String { get { getFlightDestinationCode() } }
    
    //Details
    var date: String { get { getFlightDate() } }
    var number: String { get { getFlightNumber() } }
    var price: String { get { getFinalPrice() } }
    
    
    //MARK:- COMPUTED FUNCTIONS
    //Origin
    private func getFlightDepartureHour() -> String {
        if let departureTimeString =  flightData?.time.first {
            let depatureDate = stringToDate(departureTimeString)
            return dateToHour(depatureDate)
        }
        return "Unknow"
    }
    
    private func getFlightDepartureCode() -> String {
        return tripData?.origin ?? "Unknow"
    }
    
    //Destination
    private func getFlightDestinationHour() -> String {
        if let arrivalTimeString =  flightData?.time.last {
            let arrivalDate = stringToDate(arrivalTimeString)
            return dateToHour(arrivalDate)
        }
        return "Unknow"
    }
    
    private func getFlightDestinationCode() -> String {
        return tripData?.destination ?? "Unknow"
    }
    
    //Details
    private func getFlightDate() -> String {
        if let flightDateString = flightData?.time.last {
            let date = stringToDate(flightDateString)
            let formatter = DateFormatter()
            formatter.dateFormat = "EE dd MMMM"
            return formatter.string(from: date)
        }
        return "Unknow date"
    }
    
    private func getFlightNumber() -> String {
        return flightData?.flightNumber ?? "Unknow"
    }
    
    private func getFinalPrice() -> String {
        let totalPrices = flightData?.regularFare?.fares.map{$0.publishedFare * Double($0.count)}.reduce(0, +) ?? 0
        let roundedPrice = Double(round(100 * totalPrices)/100)
        return "Total: \(roundedPrice)€"
        
    }
    
    
    
    //MARK:- AUX FUNCTIONS
    private func stringToDate(_ stringHour: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'.000'"
        return dateFormatter.date(from: stringHour) ?? Date()
    }
    
    private func dateToHour(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
