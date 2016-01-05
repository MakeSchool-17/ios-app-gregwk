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

enum ReturnStatus: ErrorType {
    case Successful
    case Error
}

class Server {
    
    let apiLocation = "http://api.commonstandardsproject.com/api/v1/"
    
    
    var jurisdictions: String?
    var request: String?
    let headers = [ "Api-Key": "t87Qym8fE8c44BxaEH4cBD73",
                    "Accept": "application/json"
    ]
    
    
    func getJurisdictionIDForState(state: String, returnClosure: (idForJurisdiction: String, returnStatus:ReturnStatus) -> Void) -> Void {
        
        Alamofire.request(.GET, apiLocation + "jurisdictions", headers: headers, encoding: .JSON).responseJSON {
            response in
            
                switch response.result {
                    case .Success:
                        if let jsonDictionary = response.result.value {
                            let arrayOfJurisdictions = jsonDictionary["data"] as! Array<Dictionary<String, String>>
                            
                            for dict in arrayOfJurisdictions {
                                if state == dict["title"] {
                                    
                                    if let newlyGrabbedJurisdictionID = dict["id"] {
//                                    print("\(state), \(newlyGrabbedJurisdictionID)")
                                        returnClosure(idForJurisdiction: newlyGrabbedJurisdictionID, returnStatus: .Successful)
                                    } else {
                                        returnClosure(idForJurisdiction: "", returnStatus: .Error)
                                    }
                                }
                            }
                    }
                        
                case .Failure:
                    print("Request failed with error: \(response.result.error)")
                }
        }
    }

    
    
    func getStandardsForJurisdiction(jurisdictionID: String, returnClosure: (standardsForJurisdiction: Dictionary<String, AnyObject>, returnStatus: ReturnStatus) -> Void) -> Void {
        
        Alamofire.request(.GET, apiLocation + "jurisdictions/" + jurisdictionID, headers: headers, encoding: .JSON).responseJSON {
            response in
          
            switch response.result {
                case .Success:
                    if let jsonDictionary = response.result.value {
                        let dictOfStandardsForState = jsonDictionary["data"] as! Dictionary<String, AnyObject>
                        returnClosure(standardsForJurisdiction: dictOfStandardsForState, returnStatus: .Successful)
                    } else {
                        returnClosure(standardsForJurisdiction: ["":""], returnStatus: .Error)
                }
                case .Failure:
                    debugPrint(response.result.error)
            }
        }
    }
    
    
    

}

