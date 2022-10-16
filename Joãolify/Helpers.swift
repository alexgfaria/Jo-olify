//
//  Helpers.swift
//  Joãolify
//
//  Created by Alex Faria on 16/10/2022.
//

import Foundation
import SwiftUI
import UIKit

struct AllColorSchemesView<Content>: View where Content: View {

    @ViewBuilder let content: () -> Content

    var body: some View {
        Group {
            content()
                .preferredColorScheme(.dark)

            content()
                .preferredColorScheme(.light)
        }
    }
}

struct AllColorSchemesViewPreview: PreviewProvider {

    static var previews: some View {

        AllColorSchemesView {
            Text("Hello, world")
        }
    }
}

/**
 Wrapper around UIViewController to support UIKit UIViewController in SwiftUI previews
 */
struct SwiftUIViewControllerWrapper: UIViewControllerRepresentable {

    let viewController: () -> UIViewController

    func makeUIViewController(context: Context) -> UIViewController {

        self.viewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

/**
 Wrapper around UIView to support UIKit UIView in SwiftUI previews
 */
struct SwiftUIViewWrapper: UIViewRepresentable {

    let view: () -> UIView

    func makeUIView(context: Context) -> UIView {

        self.view()
    }

    func updateUIView(_ uiView: UIView, context: Context) { }
}
