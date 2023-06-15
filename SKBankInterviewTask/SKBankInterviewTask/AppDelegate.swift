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
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
            
        // 设置根视图控制器
        let viewController = ViewController() // 替换成你的第一个视图控制器
        window?.rootViewController = viewController
            
        // 设置窗口可见并成为主窗口
        window?.makeKeyAndVisible()
        return true
    }

}

