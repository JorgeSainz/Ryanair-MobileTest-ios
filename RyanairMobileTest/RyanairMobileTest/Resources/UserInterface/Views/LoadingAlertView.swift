//
//  LoadingAlertView.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 20/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

class LoadingAlertView: UIViewController {
    
    //MARK:- OUTLETS
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .medium)
        loading.hidesWhenStopped = true
        loading.startAnimating()
        loading.translatesAutoresizingMaskIntoConstraints = false
        return loading
    }()
    
    lazy var loadingCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK:- INIT
    init() {
        super.init(nibName: nil, bundle: nil)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- LAYOUT
    private func setupLayout(){
        modalPresentationStyle = .overFullScreen
        modalTransitionStyle = .crossDissolve
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        setupCard()
        setupLoadingIndicator()
    }
    
    private func setupCard(){
        view.addSubview(loadingCard)
        loadingCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingCard.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingCard.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loadingCard.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    private func setupLoadingIndicator(){
        loadingCard.addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: loadingCard.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: loadingCard.centerYAnchor).isActive = true
        loadingIndicator.widthAnchor.constraint(equalToConstant: 40).isActive = true
        loadingIndicator.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
}
