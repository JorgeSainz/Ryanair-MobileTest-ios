//
//  PassengersFormTableview.swift
//  RyanairMobileTest
//
//  Created by Jorge Sainz Sueiro on 18/06/2020.
//  Copyright © 2020 Jorge Sainz Sueiro. All rights reserved.
//

import UIKit

extension PassengersFormViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { return adultsCell }
        if indexPath.row == 1 { return teensCell }
        if indexPath.row == 2 { return kidsCell }
        return babiesCell
    }
    
}

extension PassengersFormViewController: UITableViewDelegate {
    
}
