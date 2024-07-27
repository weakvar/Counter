//
//  SceneDelegate.swift
//  Counter
//
//  Created by Vladislav Kulikov on 25.07.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let counterViewController = CounterViewController()
        let rootViewController = UINavigationController(rootViewController: counterViewController)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()

        self.window = window
    }

}
