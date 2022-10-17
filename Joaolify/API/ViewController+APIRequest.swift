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

            //se existirem dados e error for nil, continuar. Senão, print erro
            guard let data = data,
                  error == nil else {

                      print("Something went wrong!")
                      return
                  }

            //have data
            let results: Popular?
            let decoder = JSONDecoder()

            do {

                results = try decoder.decode(Popular.self, from: data) //converts bytes to object

                self.results.append(contentsOf: results?.results ?? [])

                //image
                //let newArray: [UIImage?] = Array(repeating: nil, count: results?.data?.results?.count ?? 0) //guardar espaço para novas imagens
                //self.heroImages.append(contentsOf: newArray)

                DispatchQueue.main.async { //reload tem de ser feito na main queue

                    self.collectionView1.reloadData()
                }

            } catch {

                print(String(describing: error))
            }
        }
        task.resume()
    }
}

// MARK: Extensions
//extension from https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift
extension ViewController {

    func download(from url: String, index: Int, completion: @escaping (UIImage) -> Void) {

        guard let url = URL(string: url) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data,
                  let image = UIImage(data: data) else { return }

            completion(image)
        }.resume()
    }
}
