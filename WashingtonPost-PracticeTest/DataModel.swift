//
//  DataModel.swift
//  WashingtonPost_PracticeTest
//
//  Created by HARPREET SINGH on 3/6/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import UIKit

class DataModel: NSObject {
    
    static let sharedInstance = DataModel() // Singleton method to load the class in memory once.
    
    var records = [Record]()
    override init() {
        super.init()
        self.setUpNetworkCall()
    }
    
    func setUpNetworkCall () {
        let url = NSURL(string: "http://www.washingtonpost.com/wp-srv/simulation/simulation_test.json")
        
        if let JSONData = NSData(contentsOfURL: url!) {
            
            do {
                if let jsonResult = try NSJSONSerialization.JSONObjectWithData(JSONData, options: []) as? NSDictionary {
                    
                    if let postsArray = jsonResult["posts"] as? [NSDictionary] {
                        
                        for post in postsArray {
                            records.append(Record(json: post))
                        }
                    }
                }
                
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

}
