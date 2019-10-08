//
//  SwiftIssuesUITests.swift
//  SwiftIssuesUITests
//
//  Created by marcos.guedes on 10/7/19.
//  Copyright © 2019 jaya. All rights reserved.
//

import XCTest

class SwiftIssuesUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIssuesTableCreated() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let issuesTableView = app.tables["issuesTableView"]
        
         XCTAssertTrue(issuesTableView.exists, "The issues tableview exists")
        
    }
    
     func testIssuesTableCells() {
           // UI tests must launch the application that they test.
           let app = XCUIApplication()
           app.launch()
           
           let issuesTableView = app.tables["issuesTableView"]
           
           // Get an array of cells
           let tableCells =  issuesTableView.cells
        
          if tableCells.count > 0 {
                let count: Int = (tableCells.count - 1)
 
                let promise = expectation(description: "Wait for table cells")
 
                for i in stride(from: 0, to: count , by: 1) {
                    // Grab the first cell and verify that it exists and tap it
                    let tableCell = tableCells.element(boundBy: i)
                    XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")
                    // Does this actually take us to the next screen
                    tableCell.tap()
 
                    if i == (count - 1) {
                        promise.fulfill()
                    }
                // Back
                    app.navigationBars.buttons.element(boundBy: 0).tap()
                }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
 
          } else {
                XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
