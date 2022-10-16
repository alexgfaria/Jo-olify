//
//  MyCollectionViewCell.swift
//  Joãolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    private enum Constants {

        static let image1: String = "image1"
        static let image2: String = "image2"
        static let image3: String = "image3"
    }

    static let identifier = "MyCollectionViewCell"

    private let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override init(frame: CGRect) {

        super.init(frame: frame)
        contentView.addSubview(imageView)

        let images: [UIImage] = [
            UIImage(named: Constants.image1),
            UIImage(named: Constants.image2),
            UIImage(named: Constants.image3)
        ].compactMap({ $0 })

        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {

        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
