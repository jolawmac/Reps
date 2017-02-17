//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Josh & Erica on 2/13/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            RepresentativeController.searchRepresentatives(forState: state) { (representative) in
                self.representative = representative
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }
        }
    }
    
    var representative: [Representative] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    var state: String?
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representative.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? StateTableViewCell ?? StateTableViewCell()

      
        cell.representative = representative[indexPath.row]
       
        
        return cell
    }
 

}
