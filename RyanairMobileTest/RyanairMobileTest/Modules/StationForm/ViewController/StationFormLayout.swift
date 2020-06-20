//
//  StationFormLayout.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 19/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

extension StationFormViewController {
    func setupLayout(){
        setupAppareace()
        setupButton()
        setupSearchbar()
        setupTableView()
    }
    
    private func setupAppareace(){
        var destination = ""
        if let type = viewmodel.type {
            if type == .origin { destination = "origen" }
            if type == .destination { destination = "destino" }
        }
        navigationItem.title = "Seleccione su \(destination)"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.layer.shadowColor = UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00).cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 1
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        navigationController?.navigationBar.layer.shadowRadius = 0
        navigationItem.leftBarButtonItem = UIBarButtonItem()
        view.backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    }
    
    func setupSearchbar(){
        view.addSubview(searchbar)
        searchbar.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        searchbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        searchbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupTableView(){
        view.addSubview(stationsTable)
        stationsTable.topAnchor.constraint(equalTo: searchbar.bottomAnchor, constant: 0).isActive = true
        stationsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        stationsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        stationsTable.bottomAnchor.constraint(equalTo: selectButton.topAnchor, constant: -20).isActive = true
    }
    
    private func setupButton(){
        view.addSubview(selectButton)
        selectButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        selectButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        selectButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
    }
}
