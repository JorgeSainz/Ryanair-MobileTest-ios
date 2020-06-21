//
//  StationModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

// MARK: - Stations
struct Stations: Codable {
    let stations: [Station]
}

// MARK: - Station
struct Station: Codable {
    let code, name: String
    let alternateName: String?
    let alias: [String]
    let countryCode, countryName: String
    let countryAlias: String?
    let countryGroupCode: String
    let countryGroupName: CountryGroupName
    let timeZoneCode, latitude, longitude: String
    let mobileBoardingPass: Bool
    let markets: [Market]
    let notices: String?
    let tripCardImageURL: String?
    let ecoFriendly, airportShopping: Bool?

    enum CodingKeys: String, CodingKey {
        case code, name, alternateName, alias, countryCode, countryName, countryAlias, countryGroupCode, countryGroupName, timeZoneCode, latitude, longitude, mobileBoardingPass, markets, notices
        case tripCardImageURL = "tripCardImageUrl"
        case ecoFriendly, airportShopping
    }
}

extension Station {
    enum CountryGroupName: String, Codable {
        case euEea = "EU/EEA"
        case nonEUEEA = "non EU/EEA"
    }
}

extension Station: Equatable {
    static func == (lhs: Station, rhs: Station) -> Bool {
        return lhs.name == rhs.name && lhs.code == rhs.code
    }
    
    
}
