//
//  NotifViewController.swift
//  lapki
//
//  Created by Maxim Makarenkov on 27.10.2024.
//

import UIKit
import SwiftUI

class NotifViewController: UIViewController {
    private let notificationTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .lightGray
        textView.textColor = .black
        textView.layer.cornerRadius = 8
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = ""
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Notification system test"
        setupButtons()
    }

    private func setupButtons() {
        let notifButton = createButton(withTitle: "Вызвать уведомление", action: #selector(callNotification))
        
        let stackView = UIStackView(arrangedSubviews: [notifButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(notificationTextView)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            notificationTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            notificationTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            notificationTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            notificationTextView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: notificationTextView.bottomAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
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
        return button
    }

    @objc private func callNotification() {
        // Example usage of INotifier and pushing notification to Notification Center
        let notification = Pet.MOCK_CAT.composeNotification(type: .foodEnds)
        Pet.MOCK_CAT.pushNotification(notification)
        
        notificationTextView.text = InAppService.shared.activeNotification?.body ?? "No new notifications"
    }
}

struct NotifViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NotifViewController {
        .init()
    }
    
    func updateUIViewController(_ uiViewController: NotifViewController, context: Context) {}
}
