//
//  DataService.swift
//  SamplePOCMVVM
//
//  Created by Jaya on 23/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import Foundation
import Alamofire

struct DataService {
    // MARK: - Singleton
    static let shared = DataService()
    // MARK: - Methood
    func requestCountryData(with url: String, completion: @escaping (CountryInfo?, Error?) -> Void) {
        AF.request(url).response { response in
            guard let data = response.data else {
                print(ServiceError.invalidResponse(message: ErrorMessage.invalidResp + response.error.debugDescription))
                return
            }
            guard let isoLatinText = String(data: data, encoding: .isoLatin1) else {
                print(ErrorMessage.invalidDataConverion)
                return
            }
            guard let properData = isoLatinText.data(using: .utf8, allowLossyConversion: true) else {return}
            let decoder = JSONDecoder()
            do {
                let countryData = try decoder.decode(CountryInfo.self, from: properData)
                completion(countryData, nil)
            } catch {
                print(ServiceError.jsonParsingError(message: ErrorMessage.invalidJson))
                return
            }
        }
    }
}
