//
//  Record.swift
//  WashingtonPost_PracticeTest
//
//  Created by HARPREET SINGH on 3/6/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import Foundation

class Record {
    
    var title: String?
    var date: String?
    var descText: String?
    var recID: Int?
    
    init(json: NSDictionary) {
        self.title = json["title"] as? String
        self.date = json["date"] as? String
        self.descText = json["content"] as? String
        self.recID = json["id"] as? Int
}
}