//
//  TableViewControllerTests.swift
//  WashingtonPost-PracticeTest
//
//  Created by HARPREET SINGH on 3/2/16.
//  Copyright © 2016 HARPREET SINGH. All rights reserved.
//

import XCTest
import UIKit
//import WashingtonPost_PracticeTest

class TableViewControllerTests: XCTestCase {
    
    var viewController = TableViewController()
    override func setUp() {
        super.setUp()
        
    }
    
    func testViewControllerExists() {
        XCTAssertNotNil(viewController.view, "View Controller's view cannot be nil")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testNetworkActivitySpeed() {
        // This is an example of a performance test case.
        self.measureBlock {
            self.viewController.setUpNetworkCall()
        }
    }
    
}
