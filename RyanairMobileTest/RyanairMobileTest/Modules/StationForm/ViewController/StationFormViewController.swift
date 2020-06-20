//
//  StationFormViewController.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 19/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class StationFormViewController: UIViewController {
    
    //MARK:- VARIABLES
    let viewmodel = StationFormViewModel()
    
    //MARK:- OUTLETS
    lazy var stationsTable: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .singleLine
        table.backgroundColor = UIColor(red: 0.96, green: 0.97, blue: 1.00, alpha: 1.00)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var searchbar: UISearchBar = {
        let search = UISearchBar()
        search.delegate = self
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    lazy var selectButton: UIButton = {
        let button = PrimaryButton(type: .system)
        button.setTitle("Seleccionar", for: .normal)
        button.addTarget(self, action: #selector(selectStationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    //MARK:- INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        updateData()
    }
    
    private func updateData(){
        viewmodel.fetchStations {[weak self] (result) in
            switch result {
            case .success(()):
                self?.refreshView()
            case .failure(_):
                self?.showError()
            }
        }
    }
    
    func refreshView(){
        stationsTable.reloadData()
        selectButton.isEnabled = viewmodel.selectedStation != nil
    }
    
    //MARK:- UIACTIONS
    @objc func selectStationButton(){
        viewmodel.updateStation { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "Ha ocurrido un error", message: "Hemos tenido un error recuperando los aeropuertos. Por favor, inténtalo más tarde.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Entendido", style: .default) { (_) in
            alert.dismiss(animated: true) { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension StationFormViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewmodel.search(searchText)
        refreshView()
    }
}


