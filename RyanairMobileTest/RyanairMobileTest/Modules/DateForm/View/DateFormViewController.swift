//
//  DateFormViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class DateFormViewController: UIViewController {
    
    let viewmodel = DateFormViewModel()
    
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


    lazy var searchButton: UIButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Seleccionar fecha", for: .normal)
        button.addTarget(self, action: #selector(selectDate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        refreshView()
    }
    
    //MARK:- UI ACTIONS
    func refreshView(){
        formTable.reloadData()
        searchButton.isEnabled = viewmodel.selectedDate != nil
    }
    
    @objc func selectDate(){
        viewmodel.updateDepartureDate { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
}

