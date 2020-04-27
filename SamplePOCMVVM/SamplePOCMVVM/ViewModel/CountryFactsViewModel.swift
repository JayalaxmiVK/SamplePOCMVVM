//
//  CountryFactsViewModel.swift
//  SamplePOCMVVM
//
//  Created by Jaya on 23/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
protocol completionDelegate: class {
    func updateUI()
    func showError()
}
class CountryFactsViewModel {
    weak var delegate: completionDelegate?
    var countryInfo: CountryInfo? {
        didSet {
            guard let cInfo = countryInfo else { return }
            print(cInfo)
            delegate?.updateUI()
        }
    }
    var imageURLs: [URL]?
    var error: Error? {
        didSet {
            delegate?.showError()
        }
    }
    private var dataService: DataService?
    // MARK: - Constructor
    init(dataService: DataService) {
        self.dataService = dataService
    }
    // MARK: - Service
    func fetchCountryData() {
        self.dataService?.requestCountryData(with: kCountryDataServiceURLString, completion: { (response, error) in
            if let error = error {
                self.error = error
                return
            }
            guard let responseData = response else {
                print(ServiceError.invalidResponse(message: ErrorMessage.invalidResp + error.debugDescription))
                return
            }
            self.error = nil
            let compactRowData = responseData.rows.filter {$0.title != nil}
            self.countryInfo = response
            self.countryInfo?.rows = compactRowData
        })
    }
    deinit {
        dataService = nil
    }
}
extension UIImageView {
    public func imageFromServerURL(urlString: String?) {
        self.image = nil
        guard let str = urlString else { return }
        let stringUrl = URL(string: str)
        self.sd_setImage(with: stringUrl, placeholderImage: UIImage(named: "placeholder.png"))
    }
}
