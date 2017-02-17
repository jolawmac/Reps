//
//  RepresentativeController.swift
//  Representatives
//
//  Created by Josh & Erica on 2/13/17.
//  Copyright © 2017 Josh McDonald. All rights reserved.
//

import Foundation


class RepresentativeController {
    
    
    /*
     - Make and send network request
     - Wait for response as Data
     - Turn Data into JSON (serialize Data into JSON)
     - Get card dictionaries from that JSON
     - Turn those dictionaries into card objects
     - Return the cards (array, objects)
     */

    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping([Representative]) -> Void) {
        
        
        guard let url = self.baseURL else {
            fatalError("URL optional is nil")
        }
        
        let urlParameters = ["state": "\(state)", "output": "json"]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            if error != nil {
                print(error)
                completion([])
            }
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .utf8) else {
                    NSLog("No data return from network request"); completion([]); return }
            
            guard let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any],
                let repDictionaries = responseDictionary["results"] as? [[String:Any]] else { NSLog("Unable to serialize JSON. Response: \(responseDataString)"); completion([]); return }
            
            let states = repDictionaries.flatMap({ Representative(dictionary: $0) })
            completion(states)
            
            
            }
            
        
        
    }
    
}
