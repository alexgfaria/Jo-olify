//
//  HeaderCollectionReusableView.swift
//  Joaolify
//
//  Created by Alex Faria on 17/10/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = "HeaderCollectionReusableView"

    public func configure() {

        backgroundColor = .systemGreen

        addSubview(label)
    }

    private let label: UILabel = {

        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center

        return label
    }()

    override func layoutSubviews() {

        super.layoutSubviews()

        label.frame = bounds
    }
        
}
