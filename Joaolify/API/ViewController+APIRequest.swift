//
//  ViewController+APIRequest.swift
//  Joaolify
//
//  Created by Alex Faria on 17/10/2022.
//

import Foundation
import UIKit

extension ViewController {

    func getData(from url: String) {

        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data,
                  error == nil else {

                      print("Uh-oh! Something went wrong.")
                      return
                  }

            let results: Popular?
            let decoder = JSONDecoder()

            do {

                results = try decoder.decode(Popular.self, from: data) //converts bytes to object

                self.results.append(contentsOf: results?.results ?? [])

                DispatchQueue.main.async {

//                    self.collectionViewPopular.reloadData()
//                    self.collectionViewLatest.reloadData()
//                    self.collectionViewTopRated.reloadData()
//                    self.collectionViewUpcoming.reloadData()
                }

            } catch {

                print(String(describing: error))
            }
        }
        task.resume()
    }
}

// MARK: Extensions
extension ViewController {

    func download(from url: String, index: Int, completion: @escaping (UIImage) -> Void) {

        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data,
                  let image = UIImage(data: data) else { return }

            self.movieImages.append(image)

            completion(image)
        }.resume()
    }
}
