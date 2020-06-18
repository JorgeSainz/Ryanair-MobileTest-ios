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
    
    lazy var formTable: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var flightCell: FlightDestinationsCell = {
        let cell = FlightDestinationsCell()
        cell.departureSelector.valueLabel.addTarget(self, action: #selector(getDepartureStation), for: .touchUpInside)
        cell.arrivalSelector.valueLabel.addTarget(self, action: #selector(getDestinyStation), for: .touchUpInside)
        return cell
    }()
    
    lazy var dateCell: FlightDefaultFormCell = {
        let cell = FlightDefaultFormCell()
        cell.selector.descriptionLabel.text = "Ida"
        cell.selector.informationLabel.text = ""
        cell.selector.valueLabel.addTarget(self, action: #selector(getDepartureDate), for: .touchUpInside)
        return cell
    }()
    
    lazy var passengersCell: FlightDefaultFormCell = {
        let cell = FlightDefaultFormCell()
        cell.selector.descriptionLabel.text = "Pasajeros"
        cell.selector.valueLabel.addTarget(self, action: #selector(getPassengers), for: .touchUpInside)
        cell.selector.informationLabel.text = ""
        return cell
    }()

    lazy var searchButton: UIButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Buscar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
        /*
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
         */
    }
    
    //MARK:- UI ACTIONS
    
    @objc func getDepartureStation(){
        print("Origin Station")
    }
    
    @objc func getDestinyStation(){
        print("Departure Station")
    }
    
    @objc func getDepartureDate(){
        print("DepartureDate")
        let dateSelectionModule = DateFormViewController()
        navigationController?.pushViewController(dateSelectionModule, animated: true)
    }
    
    @objc func getPassengers(){
        print("Passengers")
        let passengerSelectionModule = PassengersFormViewController()
        navigationController?.pushViewController(passengerSelectionModule, animated: true)
    }


}

