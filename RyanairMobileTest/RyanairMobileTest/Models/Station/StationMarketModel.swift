//
//  MarketModel.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

// MARK: - Market
extension Station {
    struct Market: Codable {
        let code: String
        let group: Group?
        let stops: [Stop]?
        let onlyConnecting, pendingApproval, onlyPrintedBoardingPass: Bool?
    }
}


// MARK: - Market Group
extension Station.Market {
    enum Group: String, Codable {
        case canary = "CANARY"
        case canaryGold = "CANARY_GOLD"
        case city = "CITY"
        case cityGold = "CITY_GOLD"
        case domestic = "DOMESTIC"
        case domesticGold = "DOMESTIC_GOLD"
        case ethnic = "ETHNIC"
        case leisure = "LEISURE"
        case leisureGold = "LEISURE_GOLD"
        case ukp = "UKP"
        case ukpGold = "UKP_GOLD"
    }
}

// MARK: - Market Stop
extension Station.Market {
    struct Stop: Codable {
        let code: Code
        
        enum Code: String, Codable {
            case bgy = "BGY"
            case dus = "DUS"
            case fco = "FCO"
            case opo = "OPO"
        }
    }
}

