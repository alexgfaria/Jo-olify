//
//  ViewController.swift
//  Joaolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class ViewController: UIViewController {

    enum Constants {

        static let appTitle = "Joãolify"
        static let apiKey = "347e47393ba71a54fb6eed587df22f79"
        static let movieID = 550
        static let page = 1
        static let urlDetail = "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(apiKey)"
        static let urlPopular = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&page=1"
        static let urlUpcoming = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&page=1"
        static let urlLatest = "https://api.themoviedb.org/3/movie/latest?api_key=\(apiKey)"
        static let urlTopRated = "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)&page=1"
        static let urlImagePartial = "https://image.tmdb.org/t/p/w500"
        static let collectionViewPopularIdentifier = "CollectionViewPopularIdentifier"
        static let collectionViewLatestIdentifier = "CollectionViewLatestIdentifier"
        static let collectionViewTopRatedIdentifier = "CollectionViewTopRatedIdentifier"
        static let collectionViewUpcomingIdentifier = "CollectionViewUpcomingIdentifier"
    }

    var results: [Result] = []
    var movieImages: [UIImage] = []

    let scrollView: UIScrollView = {

        let view = UIScrollView()

        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let scrollStackViewContainer: UIStackView = {
        
        let view = UIStackView()

        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    let collectionViewPopular: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        layout.scrollDirection = .horizontal

        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: Constants.collectionViewPopularIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    let collectionViewLatest: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        layout.scrollDirection = .horizontal

        //collectionViewPopularIdentifier because not enough time to implement other collectionViews
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: Constants.collectionViewPopularIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    let collectionViewTopRated: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        layout.scrollDirection = .horizontal

        //collectionViewPopularIdentifier because not enough time to implement other collectionViews
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: Constants.collectionViewPopularIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    let collectionViewUpcoming: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        layout.scrollDirection = .horizontal

        //collectionViewPopularIdentifier because not enough time to implement other collectionViews
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: Constants.collectionViewPopularIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    func configureContainerView() {

        scrollStackViewContainer.addArrangedSubview(collectionViewPopular)
        scrollStackViewContainer.addArrangedSubview(collectionViewLatest)
        scrollStackViewContainer.addArrangedSubview(collectionViewTopRated)
        scrollStackViewContainer.addArrangedSubview(collectionViewUpcoming)
    }

    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.title = Constants.appTitle

        collectionViewPopular.delegate = self
        collectionViewLatest.delegate = self
        collectionViewUpcoming.delegate = self
        collectionViewTopRated.delegate = self

        collectionViewPopular.dataSource = self
        collectionViewLatest.dataSource = self
        collectionViewUpcoming.dataSource = self
        collectionViewTopRated.dataSource = self

        setupScrollView()

        self.getData(from: Constants.urlPopular)

        //not enough time
//        self.getData(from: Constants.urlLatest)
//        self.getData(from: Constants.urlUpcoming)
//        self.getData(from: Constants.urlTopRated)
    }
}
