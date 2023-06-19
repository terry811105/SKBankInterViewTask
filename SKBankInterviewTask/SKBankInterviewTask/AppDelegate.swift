//
//  AppDelegate.swift
//  SKBankInterviewTask
//
//  Created by 張文煥 on 2023/6/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController()
        let nav = UINavigationController(rootViewController: viewController)
        window?.rootViewController = nav

        window?.makeKeyAndVisible()
        return true
    }

}

