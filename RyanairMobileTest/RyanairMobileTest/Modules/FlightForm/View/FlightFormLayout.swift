//
//  FlightFormLayout.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 17/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit


extension FlightFormViewController {
    
    func setupLayout(){
        setupAppareace()
        setupButton()
        setupTableView()
    }
    
    private func setupAppareace(){
        navigationItem.title = "Buscar vuelos"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
        navigationController?.navigationBar.layer.shadowColor = UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00).cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 1
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        navigationController?.navigationBar.layer.shadowRadius = 0
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    }
    
    private func setupTableView(){
        view.addSubview(formTable)
        formTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        formTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        formTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        formTable.bottomAnchor.constraint(equalTo: searchButton.topAnchor, constant: -20).isActive = true
    }
    
    private func setupButton(){
        view.addSubview(searchButton)
        //formTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    
}
