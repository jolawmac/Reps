//
//  StateTableViewCell.swift
//  Representatives
//
//  Created by Josh & Erica on 2/13/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import UIKit

class StateTableViewCell: UITableViewCell {

   
    // Outlets 
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneNumberlabel: UILabel!
    
    // CRUD
    
    func updateViews() {
        
        guard let representative = representative else { return }
       
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        districtLabel.text = representative.district
        websiteLabel.text = representative.link
        phoneNumberlabel.text = representative.phone
    }
    
    
    var representative: Representative? {
        didSet {
            updateViews()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        representative = nil
    }
    
}
