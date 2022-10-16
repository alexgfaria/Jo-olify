//
//  ViewController.swift
//  Joãolify
//
//  Created by Alex Faria on 16/10/2022.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        overrideUserInterfaceStyle = .dark
    }


}

struct ViewControllerPreview: PreviewProvider {

    static var previews: some View {

        AllColorSchemesView {
            SwiftUIViewControllerWrapper {
                ViewController()
            }
        }
    }
}

