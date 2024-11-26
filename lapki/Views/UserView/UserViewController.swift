//
//  UserViewController.swift
//  lapki
//
//  Created by Maxim Makarenkov on 09.11.2024.
//

//import UIKit
//import SwiftUI
//
//class UserViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let swiftUIView = ParentView()
//        let hostingController = UIHostingController(rootView: swiftUIView)
//        
//        addChild(hostingController)
//        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(hostingController.view)
//        
//        NSLayoutConstraint.activate([
//            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
//            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//        
//        hostingController.didMove(toParent: self)
//    }
//    
//    
//
//}
