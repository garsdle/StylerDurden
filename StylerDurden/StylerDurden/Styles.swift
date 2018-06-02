//
//  Styles.swift
//  StylerDurden
//
//  Created by Emmanuel Garsd on 6/1/18.
//  Copyright © 2018 garsd. All rights reserved.
//

import Foundation
import MulticastDelegateSwift

protocol StylesDelegate: class {
  func updated(styles: Styles)
}

class Styles {
  let delegates = MulticastDelegate<StylesDelegate>()

  static let fontColor = UIColor(red:0, green: 0, blue:0.1, alpha:1)
  static let font = UIFont.preferredFont(forTextStyle: .title1)

  static let backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
  
  func title(_ label: UILabel) {
    label.textColor = Styles.fontColor
    label.textAlignment = .center
    label.font = Styles.font
  }
  
  func subtitle(_ label: UILabel) {
    label.textColor = Styles.fontColor
    label.textAlignment = .center
    label.font = Styles.font.withSize(12)
    label.numberOfLines = 0
  }
  
  func defaultBackground(_ view: UIView) {
    view.backgroundColor = Styles.backgroundColor
  }

  @objc func injected() {
    delegates.invokeDelegates { (delegate) in
      delegate.updated(styles: self)
    }
  }
}
