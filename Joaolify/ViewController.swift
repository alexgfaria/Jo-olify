//
//  ViewController.swift
//  Joaolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class ViewController: UIViewController {

    private enum Constants {

        static let appTitle = "Joãolify"
        static let apiKey = "347e47393ba71a54fb6eed587df22f79"
        static let url = "https://api.themoviedb.org/3/movie/550?api_key="
    }

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

    let collectionView1: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    let collectionView2: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    let collectionView3: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    let collectionView4: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        cv.translatesAutoresizingMaskIntoConstraints = false

        return cv
    }()

    func configureContainerView() {

        scrollStackViewContainer.addArrangedSubview(collectionView1)
        scrollStackViewContainer.addArrangedSubview(collectionView2)
        scrollStackViewContainer.addArrangedSubview(collectionView3)
        scrollStackViewContainer.addArrangedSubview(collectionView4)
    }

    override func viewDidLoad() {

        super.viewDidLoad()

        self.title = Constants.appTitle

        setupScrollView()

        //MARK: - HEADER

//        collectionView1.register(HeaderCollectionReusableView.self,
//                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                 withReuseIdentifier: HeaderCollectionReusableView.identifier)
//
//        collectionView2.register(HeaderCollectionReusableView.self,
//                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                 withReuseIdentifier: HeaderCollectionReusableView.identifier)
//        collectionView3.register(HeaderCollectionReusableView.self,
//                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                 withReuseIdentifier: HeaderCollectionReusableView.identifier)
//        collectionView4.register(HeaderCollectionReusableView.self,
//                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//                                 withReuseIdentifier: HeaderCollectionReusableView.identifier)
    }
}
