//
//  CountryFactsTableViewCell.swift
//  SamplePOCMVVM
//
//  Created by Jaya on 23/04/20.
//  Copyright © 2020 Jaya. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit

class CountryFactsTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var factData: Fact? {
        didSet {
            guard let data = factData else { return }
            self.titleLabel.text = data.title
            self.factDescriptionLabel.text = data.description
            self.factImage.imageFromServerURL(urlString: data.imageHref)
        }
    }
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let factImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.borderWidth = 0.5
        imgView.layer.masksToBounds = false
        imgView.layer.borderColor = UIColor.lightGray.cgColor
        return imgView
    }()
    
    private let factDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .gray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    // MARK: - Intialiser
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(factImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(factDescriptionLabel)
        
        //Adding constraints using Snapkit pod.
        factImage.snp.makeConstraints { (maker) in
            maker.width.equalTo(44)
            maker.height.equalTo(44)
            maker.centerY.equalTo(contentView)
            maker.leading.equalTo(10)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(10)
            make.trailing.equalTo(contentView).offset(-10)
            make.leading.equalTo(factImage.snp.trailing).offset(10)
        }
        
        factDescriptionLabel.snp.makeConstraints { (maker) in
            maker.width.equalTo(titleLabel.snp.width)
            maker.top.equalTo(titleLabel.snp.bottom).offset(5)
            maker.leading.equalTo(factImage.snp.trailing).offset(10)
            maker.bottom.equalTo(contentView).offset(-5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(kIntialiserError)
    }
}
