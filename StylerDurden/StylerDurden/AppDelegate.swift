//
//  AppDelegate.swift
//  StylerDurden
//
//  Created by Emmanuel Garsd on 6/1/18.
//  Copyright © 2018 garsd. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var uiCoordinator: RootCoordinator?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    //This is what Injection uses to monitor files and inject code
    #if DEBUG
    Bundle(path: "/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle")?.load()
    #endif
    let window = UIWindow(frame: UIScreen.main.bounds)
    uiCoordinator = RootCoordinator(window: window)
    self.window = window

    return true
  }

}

