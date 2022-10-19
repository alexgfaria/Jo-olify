//
//  MovieDetailViewController.swift
//  Joaolify
//
//  Created by Alex Faria on 18/10/2022.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {

    var voteAverage: Float
    var poster: UIImage

    let movieTitle: UILabel = {

        let label = UILabel()

        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = .black.withAlphaComponent(0.6)

        return label
    }()

    init(voteAverage: Float, poster: UIImage) {

        self.voteAverage = voteAverage
        self.poster = poster

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {

        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))

        label.center = CGPoint(x: 100, y: 100)
        label.textAlignment = .center
        label.text = String("Score: \(voteAverage) ⭐️")
        label.textColor = .white

        let movieImage: UIImageView = {

            let movieImage = UIImageView()

            movieImage.clipsToBounds = true
            movieImage.contentMode = .scaleAspectFill
            movieImage.layer.cornerRadius = 10

            return movieImage
        }()

        movieImage.image = poster
        movieImage.center = CGPoint(x: 100, y: 100)

        movieImage.frame = CGRect(x: view.frame.size.width / 2 - movieImage.frame.size.width,
                                  y: 20,
                                  width: view.frame.size.width - (view.frame.size.width/2),
                                  height: view.frame.size.height - (view.frame.size.height/1.5))

        view.backgroundColor = .black

        self.view.addSubview(label)
        self.view.addSubview(movieImage)

        movieImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: label.topAnchor).isActive = true

        label.topAnchor.constraint(equalTo: movieImage.topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
