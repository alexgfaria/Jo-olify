//
//  CollectionView.swift
//  Joaolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    func setupCollectionView() {

        collectionView1.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(collectionView1)

        // MARK: constrain collection view
        collectionView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        collectionView1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        collectionView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        collectionView1.heightAnchor.constraint(equalTo: collectionView1.widthAnchor, multiplier: 0.5).isActive = true
        collectionView1.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        collectionView1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true

        collectionView2.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionView2)

        collectionView2.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 50).isActive = true
        collectionView2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        collectionView2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        collectionView2.heightAnchor.constraint(equalTo: collectionView2.widthAnchor, multiplier: 0.5).isActive = true
        collectionView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        collectionView3.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionView3)

        collectionView3.topAnchor.constraint(equalTo: collectionView2.bottomAnchor, constant: 50).isActive = true
        collectionView3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        collectionView3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        collectionView3.heightAnchor.constraint(equalTo: collectionView3.widthAnchor, multiplier: 0.5).isActive = true
        collectionView3.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        collectionView4.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(collectionView4)

        collectionView4.topAnchor.constraint(equalTo: collectionView3.bottomAnchor, constant: 50).isActive = true
        collectionView4.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        collectionView4.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        collectionView4.heightAnchor.constraint(equalTo: collectionView4.widthAnchor, multiplier: 0.5).isActive = true
        collectionView4.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        collectionView1.delegate = self
        collectionView1.dataSource = self

        collectionView2.delegate = self
        collectionView2.dataSource = self

        collectionView3.delegate = self
        collectionView3.dataSource = self

        collectionView4.delegate = self
        collectionView4.dataSource = self

        collectionView1.showsHorizontalScrollIndicator = false
        collectionView2.showsHorizontalScrollIndicator = false
        collectionView3.showsHorizontalScrollIndicator = false
        collectionView4.showsHorizontalScrollIndicator = false
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 5
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath) as! MyCollectionViewCell


        return cell
    }

    //MARK: - Header
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
//                                                                      withReuseIdentifier: HeaderCollectionReusableView.identifier,
//                                                                      for: indexPath) as! HeaderCollectionReusableView
//
//        header.configure()
//
//        return header
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//
//        return CGSize(width: view.frame.size.width, height: 200)
//    }
}