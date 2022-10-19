//
//  CollectionView.swift
//  Joaolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIViewControllerTransitioningDelegate {

    func setupCollectionView() {

        collectionViewPopular.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(collectionViewPopular)

        // MARK: constrain collection view
        collectionViewPopular.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        collectionViewPopular.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionViewPopular.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        collectionViewPopular.heightAnchor.constraint(equalTo: collectionViewPopular.widthAnchor, multiplier: 0.5).isActive = true
        collectionViewPopular.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        collectionViewPopular.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

        collectionViewLatest.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionViewLatest)

        collectionViewLatest.topAnchor.constraint(equalTo: collectionViewPopular.bottomAnchor, constant: 50).isActive = true
        collectionViewLatest.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionViewLatest.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        collectionViewLatest.heightAnchor.constraint(equalTo: collectionViewLatest.widthAnchor, multiplier: 0.5).isActive = true
        collectionViewLatest.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        collectionViewTopRated.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionViewTopRated)

        collectionViewTopRated.topAnchor.constraint(equalTo: collectionViewLatest.bottomAnchor, constant: 50).isActive = true
        collectionViewTopRated.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionViewTopRated.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        collectionViewTopRated.heightAnchor.constraint(equalTo: collectionViewTopRated.widthAnchor, multiplier: 0.5).isActive = true
        collectionViewTopRated.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        collectionViewUpcoming.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionViewUpcoming)

        collectionViewUpcoming.topAnchor.constraint(equalTo: collectionViewTopRated.bottomAnchor, constant: 50).isActive = true
        collectionViewUpcoming.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionViewUpcoming.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        collectionViewUpcoming.heightAnchor.constraint(equalTo: collectionViewUpcoming.widthAnchor, multiplier: 0.5).isActive = true
        collectionViewUpcoming.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        collectionViewPopular.delegate = self
        collectionViewPopular.dataSource = self

        collectionViewLatest.delegate = self
        collectionViewLatest.dataSource = self

        collectionViewTopRated.delegate = self
        collectionViewTopRated.dataSource = self

        collectionViewUpcoming.delegate = self
        collectionViewUpcoming.dataSource = self

        collectionViewPopular.showsHorizontalScrollIndicator = false
        collectionViewLatest.showsHorizontalScrollIndicator = false
        collectionViewTopRated.showsHorizontalScrollIndicator = false
        collectionViewUpcoming.showsHorizontalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        //not enough time -- for collection view with different amounts of cells
        //if collectionView == self.collectionViewPopular {

            return results.count // Replace with count of your data for collectionViewA
            //}

            //return 0 // Replace with count of your data for collectionViewB
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        //not enough time to implement different collectionViews
        //if collectionView == self.collectionViewPopular {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewPopularIdentifier,
                                                          for: indexPath) as! CustomCollectionViewCell

            let poster_path: String
            let vote_average: Float

            var result: Result

            poster_path = results[indexPath.item].poster_path ?? ""
            vote_average = results[indexPath.item].vote_average ?? 0

            if vote_average >= 6 {

                cell.movieTitle.textColor = .systemYellow
            }

            let urlImage = Constants.urlImagePartial + poster_path

            result = results[indexPath.item]
            cell.configure(label: result.title ?? "No Title 🤷")

            //image
            self.download(from: urlImage, index: indexPath.item) { image in

                DispatchQueue.main.async {

                    cell.imageView.image = image

                }
            }

            return cell

        //other collectionViews
       // }

//        else if collectionView == self.collectionViewLatest { {
//
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.collectionViewPopularIdentifier,
//                                                          for: indexPath) as! CustomCollectionViewCell
//
//            // ...Set up cell
//
//            return cell
//        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let movieDetailViewController = MovieDetailViewController(voteAverage: results[indexPath.item].vote_average ?? 0,
                                                                  poster: movieImages[indexPath.item])
        let voteAverage = results[indexPath.item].vote_average ?? 0

        movieDetailViewController.transitioningDelegate = self
        movieDetailViewController.definesPresentationContext = true
        movieDetailViewController.modalPresentationStyle = .pageSheet

        if #available(iOS 15.0, *) {

            movieDetailViewController.sheetPresentationController?.detents = [.medium()]

        } else {
            
            // Fallback on earlier versions
        }

        if voteAverage >= 6 {

            present(movieDetailViewController, animated: true)

        } else {

            let alert = UIAlertController(title: "Uh-oh!",
                                          message: "This movie has a rating of \(String(voteAverage))",
                                          preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            self.present(alert, animated: true, completion: nil)
        }
    }
}
