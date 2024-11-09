//
//  TestingViewController.swift
//  lapki
//
//  Created by Maxim Makarenkov on 04.11.2024.
//

import UIKit

class TestingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Lapki function test"
        
        let button1 = createButton(withTitle: "Notification system", action: #selector(navigateToNotif))
        
        view.addSubview(button1)
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    private func createButton(withTitle title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: action, for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    @objc private func navigateToNotif() {
        let vc = NotifViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
