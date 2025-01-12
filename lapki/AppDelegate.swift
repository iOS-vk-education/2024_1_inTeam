//
//  AppDelegate.swift
//  lapki
//
//  Created by Maxim Makarenkov on 27.10.2024.
//

import UIKit
import SwiftUI
import YandexMapsMobile
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        YMKMapKit.setApiKey(KeyManager.getKey("YandexMapKey") ?? "SET API KEY")
        YMKMapKit.sharedInstance()
        
        UNUserNotificationCenter.current().delegate = self
        application.registerForRemoteNotifications()
        
        NotificationCenter.shared.loadSubscriptions()
        
        Container.shared.register(PlaceRepository.self) { _ in
            PlaceRepositoryTestImpl()
        }
        .inObjectScope(.container)
        
        Container.shared.register(UserRepository.self) { _ in
            UserTestDB()
        }
        .inObjectScope(.container)
        
        Container.shared.register(PetRepository.self) { _ in
            PetRepositoryImpl()
        }
        .inObjectScope(.container)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("App will enter foreground")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App did enter background")
    }
}


