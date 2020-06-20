//
//  ViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class FlightFormViewController: UIViewController {
    
    let viewmodel = FlightFormViewModel()
    
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
        let dateInfo = viewmodel.departureInformation
        let cell = FlightDefaultFormCell()
        cell.selector.descriptionLabel.text = "Ida"
        cell.selector.informationLabel.text = ""
        cell.selector.valueLabel.setTitle(dateInfo, for: .normal)
        cell.selector.valueLabel.addTarget(self, action: #selector(getDepartureDate), for: .touchUpInside)
        return cell
    }()
    
    lazy var passengersCell: FlightDefaultFormCell = {
        let passengersInfo = viewmodel.passengersInformation
        let cell = FlightDefaultFormCell()
        cell.selector.descriptionLabel.text = "Pasajeros"
        cell.selector.valueLabel.addTarget(self, action: #selector(getPassengers), for: .touchUpInside)
        cell.selector.informationLabel.text = ""
        cell.selector.valueLabel.setTitle(passengersInfo, for: .normal)
        return cell
    }()

    lazy var searchButton: UIButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Buscar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK:- INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshView()
    }
    
    func refreshView(){
        if let org = viewmodel.origin { flightCell.setStation(station: org, type: .origin) }
        if let dest = viewmodel.destiny { flightCell.setStation(station: dest, type: .destination) }
        dateCell.selector.valueLabel.setTitle(viewmodel.departureInformation, for: .normal)
        passengersCell.selector.valueLabel.setTitle(viewmodel.passengersInformation, for: .normal)
    }
    
    //MARK:- UI ACTIONS
    @objc func getDepartureStation(){
        let stationSelectionModule = StationFormViewController()
        stationSelectionModule.viewmodel.type = .origin
        stationSelectionModule.viewmodel.delegate = viewmodel
        stationSelectionModule.viewmodel.selectedStation = viewmodel.origin
        if let destinyStation = viewmodel.destiny { stationSelectionModule.viewmodel.forbiddenStations = [destinyStation] }
        navigationController?.pushViewController(stationSelectionModule, animated: true)
    }
    
    @objc func getDestinyStation(){
        let stationSelectionModule = StationFormViewController()
        stationSelectionModule.viewmodel.type = .destination
        stationSelectionModule.viewmodel.delegate = viewmodel
        stationSelectionModule.viewmodel.selectedStation = viewmodel.destiny
        if let originStation = viewmodel.origin { stationSelectionModule.viewmodel.forbiddenStations = [originStation] }
        navigationController?.pushViewController(stationSelectionModule, animated: true)
    }
    
    @objc func getDepartureDate(){
        let dateSelectionModule = DateFormViewController(date: viewmodel.departureDate)
        dateSelectionModule.viewmodel.delegate = viewmodel
        navigationController?.pushViewController(dateSelectionModule, animated: true)
    }
    
    @objc func getPassengers(){
        let passengerSelectionModule = PassengersFormViewController(adults: viewmodel.adults, teens: viewmodel.teens, kids: viewmodel.kids)
        passengerSelectionModule.viewmodel.delegate = viewmodel
        navigationController?.pushViewController(passengerSelectionModule, animated: true)
    }


}

