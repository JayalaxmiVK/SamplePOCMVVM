//
//  CountryFactsDataMeodel.swift
//  SamplePOCMVVM
//
//  Created by Jaya on 23/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import Foundation

struct CountryInfo: Codable {
    var title: String
    var rows: [Fact]
}

struct Fact: Codable {
    var title: String?
    var imageHref: String?
    var description: String?
}
