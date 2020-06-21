//
//  AppEndpoints.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import Foundation

fileprivate let BASE_URL: String = "https://tripstest.ryanair.com/"

extension URL {
    struct Endpoints {
        static let stations = URL(string: BASE_URL + "static/stations.json")!
        static let flights = URL(string: BASE_URL + "api/v4/Availability")!
    }
}
