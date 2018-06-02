//
//  StylerDurden.swift
//  StylerDurden
//
//  Created by Emmanuel Garsd on 6/1/18.
//  Copyright © 2018 garsd. All rights reserved.
//

import UIKit

struct StylerDurden {
  let view: UIView
  
  typealias Stylist<T> = (T) -> Void
  
  func apply<T>(_ stylists: [Stylist<T>]) {
    for stylist in stylists {
      guard let view = view as? T else {
        print("Style cannot be applied")
        return
      }
      stylist(view)
    }
  }
}

extension UIView {
  var sd: StylerDurden {
    return StylerDurden(view: self)
  }
}
