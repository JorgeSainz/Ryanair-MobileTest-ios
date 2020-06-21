//
//  FlightsResultsViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class FlightsResultsViewController: UIViewController {
    
    //MARK:- VARIABLES
    let viewmodel = FlightsResultsViewModel()
    
    //MARK:- OUTLETS
    lazy var stationsTable: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        table.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK:- INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}
