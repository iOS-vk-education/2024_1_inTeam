//
//  NotifViewController.swift
//  lapki
//
//  Created by Maxim Makarenkov on 27.10.2024.
//

import UIKit

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
        let inAppRegButton = createButton(withTitle: "Подписаться на In-app", action: #selector(subscribeInApp))
        let systemRegButton = createButton(withTitle: "Подписаться на System", action: #selector(subscribeSystem))
        let notifButton = createButton(withTitle: "Вызвать уведомление", action: #selector(callNotification))
        let inAppUnsubButton = createButton(withTitle: "Отписаться от In-app", action: #selector(inAppUnsub))
        let systemUnsubButton = createButton(withTitle: "Отписаться от System", action: #selector(systemUnsub))
        
        let stackView = UIStackView(arrangedSubviews: [inAppRegButton, systemRegButton, notifButton, inAppUnsubButton, systemUnsubButton])
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
            
            // Констрейнты для stackView
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

    @objc private func subscribeInApp() {
        NotificationCenter.shared.addInAppService(InAppService.shared)
    }

    @objc private func subscribeSystem() {
        UNUserNotificationCenter.current().authorize()
    }

    @objc private func callNotification() {
        // Example usage of INotifier and pushing notification to Notification Center
        let notification = Cat.MOCK_CAT.composeNotification(type: .foodEnds)
        Cat.MOCK_CAT.pushNotification(notification)
        
        notificationTextView.text = InAppService.shared.activeNotification?.body ?? "No new notifications"
    }

    @objc private func inAppUnsub() {
        NotificationCenter.shared.removeInAppService()
    }

    @objc private func systemUnsub() {
        NotificationCenter.shared.removeSystemService()
    }
}
