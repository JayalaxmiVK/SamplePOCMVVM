//
//  Constants.swift
//  SamplePOCMVVM
//
//  Created by Jaya on 24/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import Foundation

// MARK: - String Constant

let kCellId = "CountryFactsTableCellIdentifier"
let kMinimumRowHeight = 100.0
let kEmptyString = ""
let kIntialiserError = "init(coder:) has not been implemented"

// MARK: - Service URL Constant
let kCountryDataServiceURLString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

enum ServiceError: Error {
    case invalidURL(message: String)
    case connectionError(message: String)
    case jsonParsingError(message: String)
    case invalidResponse(message: String)
}

struct ErrorMessage {
    static let invalidURLString = "URL is not valid. May be it is empty"
    static let invalidDataConverion = "Data is not of correct form, cannot convert to string"
    static let invalidResp = "Data is invalid"
    static let invalidJson = "JSON is invalid"
}
