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
        
        let notificationButton = createButton(withTitle: "Notification system", action: #selector(navigateToNotif))
        
        let userViewButton = createButton(withTitle: "User sheet view", action: #selector(navigateToUserView))
        
        view.addSubview(notificationButton)
        view.addSubview(userViewButton)
        
        NSLayoutConstraint.activate([
            notificationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notificationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userViewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userViewButton.centerYAnchor.constraint(equalTo: notificationButton.bottomAnchor, constant: 40),
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
    
    @objc private func navigateToUserView() {
        let vc = UserViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
