//
//  MyCollectionViewCell.swift
//  Joãolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    private enum Constants {

        static let image1: String = "image1"
        static let image2: String = "image2"
        static let image3: String = "image3"
        static let image4: String = "image4"
    }

    static let identifier = "CustomCollectionViewCell"

    let imageView: UIImageView = {

        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10

        return imageView
    }()

    override init(frame: CGRect) {

        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(movieTitle)

        let images: [UIImage] = [
            UIImage(named: Constants.image1),
            UIImage(named: Constants.image2),
            UIImage(named: Constants.image3),
            UIImage(named: Constants.image4)
        ].compactMap({ $0 })

        imageView.image = images.randomElement()
        contentView.clipsToBounds = true


    }

    let movieTitle: UILabel = {

        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

        return label
    }()

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {

        super.layoutSubviews()
        imageView.frame = contentView.bounds
        self.movieTitle.frame = CGRect(x: 0,
                                          y: contentView.frame.size.height - 50,
                                          width: contentView.frame.size.width,
                                          height: 50)
    }

    public func configure(label: String) {

        self.movieTitle.text = label
    }
}
