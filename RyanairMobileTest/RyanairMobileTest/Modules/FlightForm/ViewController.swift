//
//  ViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class FlightFormViewController: UIViewController {
    
    let connection = ConnectionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let url = URL(string: "https://tripstest.ryanair.com/api/v4/Availability?origin=DUB&destination=STN&dateout=2020-08-09&datein=&flexdaysbeforeout=3&flexdaysout=3&flexdaysbeforein=3&flexdaysin=3&adt=1&teen=0&chd=0&roundtrip=false&ToUs=AGREED")!
        
        //let url = URL(string: "https://tripstest.ryanair.com/static/stations.json")!

        
        connection.get(url: url) { (result: Result<Trips,Error>) in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }


}

