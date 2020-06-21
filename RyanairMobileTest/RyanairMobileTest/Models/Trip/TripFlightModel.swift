//
//  TripFlightModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

// MARK: - Flight
extension Trip {
    struct Flight: Codable {
        let faresLeft: Int
        let flightKey: String
        let infantsLeft: Int
        let regularFare: TripFare?
        let businessFare: TripFare?
        let operatedBy: String
        let segments: [Segment]
        let flightNumber: String
        let time, timeUTC: [String]
        let duration: String
    }
}


// MARK: - RegularFare
extension Trip.Flight {
    struct TripFare: Codable {
        let fareKey: String
        let fareClass: String
        let fares: [Fare]
    }
}

// MARK: - Fare
extension Trip.Flight {
    struct Fare: Codable {
        let type: String
        let amount: Double
        let count: Int
        let hasDiscount: Bool
        let publishedFare: Double
        let discountInPercent: Int
        let hasPromoDiscount: Bool
        let discountAmount: Int
    }
}

// MARK: - Segment
extension Trip.Flight {
    struct Segment: Codable {
        let segmentNr: Int
        let origin: String
        let destination: String
        let flightNumber: String
        let time, timeUTC: [String]
        let duration: String
    }
}

