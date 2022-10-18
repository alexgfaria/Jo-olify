//
//  MyCollectionViewCell.swift
//  Joãolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

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

        contentView.clipsToBounds = true
    }

    let movieTitle: UILabel = {

        let label = UILabel()

        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = .black.withAlphaComponent(0.6)

        return label
    }()

    required init?(coder: NSCoder) {
        
        fatalError()
    }

    override func layoutSubviews() {

        super.layoutSubviews()

        self.imageView.frame = CGRect(x: 0,
                                      y: 0,
                                      width: contentView.frame.size.width,
                                      height: contentView.frame.size.height)

        self.movieTitle.frame = CGRect(x: 0,
                                       y: contentView.frame.size.height - 50,
                                       width: contentView.frame.size.width,
                                       height: 50)
    }

    public func configure(label: String) {

        self.movieTitle.text = label
    }
}
