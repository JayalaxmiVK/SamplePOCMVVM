//
//  SamplePOCMVVMUITests.swift
//  SamplePOCMVVMUITests
//
//  Created by Jaya on 27/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import XCTest

class SamplePOCMVVMUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
            app.launch()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
