//
//  RootCoordinator.swift
//  StylerDurden
//
//  Created by Emmanuel Garsd on 6/1/18.
//  Copyright © 2018 garsd. All rights reserved.
//

import UIKit

class RootCoordinator {
  let styles = Styles()
  
  init(window: UIWindow) {
    let mainVC = ViewController(styles: styles)
    window.rootViewController = mainVC
    window.makeKeyAndVisible()
  }
}
