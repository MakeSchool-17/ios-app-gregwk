//
//  Server.swift
//  PortfolioTracker
//
//  Created by Mike Kane on 12/17/15.
//  Copyright © 2015 Mike Kane. All rights reserved.
//

import Foundation
import Alamofire
import Gloss



class Server {
    
    let apiLocation = "http://api.commonstandardsproject.com/api/v1/"
    
    
    var jurisdictions: String?
    var request: String?
    let headers = [ "Api-Key": "t87Qym8fE8c44BxaEH4cBD73",
                    "Accept": "application/json"
    ]
    
    
    func getJurisdictionIDsAsJSON() {
        
        Alamofire.request(.GET, apiLocation + "jurisdictions", headers: headers, encoding: .JSON).responseJSON {
            response in
            
                switch response.result {
                    case .Success:
                        if let jsonDictionary = response.result.value {
                            print(jsonDictionary)
                            let arrayOfJurisdictions = jsonDictionary["data"] as! Array<Dictionary<String, String>>
                            let firstJurisdiction = arrayOfJurisdictions[0]
                            print(firstJurisdiction)
                    }
                        
                    case .Failure(let error):
                        break
                    
                }
                print("temp")
        }
    
    }

    
    func getAllStandardsForJurisdiction(jursidictionID: String) {
        Alamofire.request(.GET, apiLocation + "jurisdictions/\(jursidictionID)", headers: headers)
            .responseJSON { response in
                
        }
    }
    
    
}