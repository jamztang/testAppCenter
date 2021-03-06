//
//  AppDelegate.swift
//  testAppCenter
//
//  Created by James Tang on 21/10/2020.
//

import UIKit

#if canImport(AppCenter)
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        #if canImport(AppCenter)
        MSAppCenter.start("6886f62e-693a-48d1-a656-6f961daec622", withServices:[
          MSAnalytics.self,
          MSCrashes.self
        ])
        Swift.print("TTT canImport AppCenter")
        #endif

        #if targetEnvironment(macCatalyst)
        Swift.print("TTT catalyst")
        MSAnalytics.trackEvent("Launch Catalyst")
        #endif

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


}

