//
//  SceneDelegate.swift
//  Coins
//
//  Created by Maxim Egorov on 06.07.2020.
//  Copyright © 2020 Maxim Egorov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        setup(window)
    }

    private func setup(_ window: UIWindow?) {
        let cryptoCurrenciesService = CryptoCurrenciesService(networkDispatcher: NetworkDispatcher())
        let paginator = Paginator(loadCompletion: cryptoCurrenciesService.getCryptoCurrencies, cancelCompletion: cryptoCurrenciesService.cancelLoadCryptocurrencies)
        let viewController = ViewController(paginator: paginator)
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

