//
//  PassengersFormViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class PassengersFormViewController: UIViewController {
    
    //MARK:- VARIABLES
    let viewmodel = PassengersFormViewModel()
    
    //MARK:- OUTLETS
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
    
    lazy var adultsCell: PassengerPickerCell = {
        let cell = PassengerPickerCell(passenger: .adults)
        cell.picker.delegate = self
        return cell
    }()
    
    lazy var teensCell: PassengerPickerCell = {
        let cell = PassengerPickerCell(passenger: .teens)
        cell.picker.delegate = self
        return cell
    }()
    
    lazy var kidsCell: PassengerPickerCell = {
        let cell = PassengerPickerCell(passenger: .kids)
        cell.picker.delegate = self
        return cell
    }()


    lazy var saveButton: UIButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Confirmar", for: .normal)
        button.addTarget(self, action: #selector(savePassengers), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK:- INIT
    init(adults: Int? = nil, teens: Int? = nil, kids: Int? = nil){
        super.init(nibName: nil, bundle: nil)
        adultsCell.picker.value = adults ?? 1
        teensCell.picker.value = teens ?? 0
        kidsCell.picker.value = kids ?? 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    //MARK:- UI ACTIONS
    @objc func savePassengers(){
        viewmodel.updatePassengers(adults: adultsCell.picker.value, teens: teensCell.picker.value, kids: kidsCell.picker.value) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }

}

extension PassengersFormViewController: PassengerPickerDelegate {

    func showAlertMaxPassengers(_ type: PassengerType) {
        var passengerName: String = "adultos"
        if type == .teens { passengerName = "adolescentes" }
        if type == .kids { passengerName = "niños" }
        let alert = UIAlertController(title: "Lo sentimos", message: "Solo se puede reservar un máximo de 6 \(passengerName).", preferredStyle: .alert)
        let action = UIAlertAction(title: "Entendido", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
