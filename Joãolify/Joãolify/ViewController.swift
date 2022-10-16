//
//  ViewController.swift
//  Joãolify
//
//  Created by Alex Faria on 16/10/2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    private let collectionView = UICollectionView(frame: .zero,
                                                  collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {

        super.viewDidLoad()

        view.addSubview(collectionView)

        collectionView.register(MyCollectionViewCell.self,
                                forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier,
                                                      for: indexPath)

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 30
    }


}
