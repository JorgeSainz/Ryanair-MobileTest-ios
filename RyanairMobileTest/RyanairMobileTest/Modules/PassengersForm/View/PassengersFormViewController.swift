//
//  PassengersFormViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class PassengersFormViewController: UIViewController {
    
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
    
    lazy var adultsCell: PassengerSelectorCell = {
        let cell = PassengerSelectorCell()
        cell.passengerLabel.text = "Adultos"
        cell.descriptionLabel.text = "Mayores de 16 años."
        return cell
    }()
    
    lazy var teensCell: PassengerSelectorCell = {
        let cell = PassengerSelectorCell()
        cell.passengerLabel.text = "Adolescentes"
        cell.descriptionLabel.text = "De 12 a 15 años."
        return cell
    }()
    
    lazy var kidsCell: PassengerSelectorCell = {
        let cell = PassengerSelectorCell()
        cell.passengerLabel.text = "Niños"
        cell.descriptionLabel.text = "2-11 años."
        return cell
    }()
    
    lazy var babiesCell: PassengerSelectorCell = {
        let cell = PassengerSelectorCell()
        cell.passengerLabel.text = "Bebés"
        cell.descriptionLabel.text = "Menor de 2 años."
        return cell
    }()

    lazy var searchButton: UIButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Confirmar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLayout()
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
    }


}
