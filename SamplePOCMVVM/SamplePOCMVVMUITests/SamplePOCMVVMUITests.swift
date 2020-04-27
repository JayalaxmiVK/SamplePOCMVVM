//
//  SamplePOCMVVMUITests.swift
//  SamplePOCMVVMUITests
//
//  Created by Jaya on 27/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import XCTest

class SamplePOCMVVMUITests: XCTestCase {
    var app: XCUIApplication?
    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
    }
    override func tearDown() {
        app = nil
    }
    func testTableCell() {
        app?.launch()
        let tablesQuery = app?.tables
        let cell = tablesQuery?.cells.element(matching: .cell, identifier: "CountryFactsTableCellIdentifier")
        XCTAssertNotNil(cell, "Cell exists.")
    }
    func testExample() {
        app?.launch()
        let tablesQuery = app?.tables
        let cell = tablesQuery?.staticTexts["Flag"]
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: cell, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
    }
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
