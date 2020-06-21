//
//  FlightsResultsLayout.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

extension FlightsResultsViewController {
    
    func setupLayout(){
        setupAppareace()
        setupTableView()
    }
    
    private func setupAppareace(){
        navigationItem.title = "\(viewmodel.originName) -> \(viewmodel.destinationName) "
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.09, green: 0.20, blue: 0.54, alpha: 1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.layer.shadowColor = UIColor(red: 0.92, green: 0.79, blue: 0.33, alpha: 1.00).cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 1
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 3)
        navigationController?.navigationBar.layer.shadowRadius = 0
        //navigationItem.leftBarButtonItem = UIBarButtonItem()
        view.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
    }
        
    private func setupTableView(){
        view.addSubview(stationsTable)
        stationsTable.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0).isActive = true
        stationsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        stationsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        stationsTable.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
    }

}
