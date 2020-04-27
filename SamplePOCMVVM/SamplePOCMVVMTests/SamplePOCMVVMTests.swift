//
//  SamplePOCMVVMTests.swift
//  SamplePOCMVVMTests
//
//  Created by Jaya on 23/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import XCTest
@testable import SamplePOCMVVM

class SamplePOCMVVMTests: XCTestCase {
    var countryFctsDataMdelMockObj: CountryFactsViewModel?
    var tableViewCntrolerMockObj: CountryFactsTableViewController?
    var dataServiceMockObject: DataService?
    override func setUp() {
        dataServiceMockObject = DataService()
        countryFctsDataMdelMockObj = CountryFactsViewModel(dataService: dataServiceMockObject!)
        tableViewCntrolerMockObj = CountryFactsTableViewController()
    }
    override func tearDown() {
        countryFctsDataMdelMockObj = nil
        tableViewCntrolerMockObj = nil
    }
    func testTableviewCellRegistration() {
        //Set the expection
        let expectation = self.expectation(description: "Tableviewcell is registered")
        //Set some random index
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = tableViewCntrolerMockObj?.tableView(tableViewCntrolerMockObj!.tableView, cellForRowAt: indexPath)
        //Making sure cell is present is downloaded
        XCTAssertNotNil(cell, "Have not resgisterd the tableview cell")
        // Fulfill the expectation to indicate that the background task has finished successfully.
        expectation.fulfill()
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    func testJsonDataParsing() {
        let expectation = self.expectation(description: "JSON Data successfully Parsed")
        dataServiceMockObject?.requestCountryData(with: kCountryDataServiceURLString, completion: { (_, err) in
            XCTAssertNotNil(err, "JSON Parsing error")
        })
        expectation.fulfill()
        wait(for: [expectation], timeout: 10.0)
    }
}
