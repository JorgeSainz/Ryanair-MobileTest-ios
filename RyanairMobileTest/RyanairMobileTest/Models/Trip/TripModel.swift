//
//  TripModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

// MARK: - Trips
struct Trips: Codable {
    let termsOfUse: String
    let currency: String
    let currPrecision: Int
    let routeGroup, tripType, upgradeType: String
    let trips: [Trip]?
    let serverTimeUTC: String
}

// MARK: - Trip
struct Trip: Codable {
    let origin, originName, destination, destinationName: String?
    let routeGroup, tripType, upgradeType: String
    let dates: [DateElement]?
}

// MARK: - DateElement
extension Trip {
    struct DateElement: Codable {
        let dateOut: String
        let flights: [Flight]
    }
}

