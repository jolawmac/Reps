//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Josh & Erica on 2/13/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        }

   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

        let state = States.all[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
   
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
                if let detailsVC = segue.destination as? StateDetailTableViewController,
                    let indexPath = tableView.indexPathForSelectedRow?.row {
                    let state = States.all[indexPath]
                    detailsVC.state = state
                }
            }
            
        }
    
    


