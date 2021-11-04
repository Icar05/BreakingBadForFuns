//
//  AppDelegate.swift
//  BreakingBadForFuns
//
//  Created by Apple Mac Book on 07.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    
    fileprivate let component = Component()
    
    fileprivate lazy var viewBuilder = SwiftUIViewBuilder(component: component)
    
    fileprivate lazy var router = Router(viewBuilder: viewBuilder)
    
    
    
    func getViewBuilder() -> SwiftUIViewBuilder{
        return self.viewBuilder
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

