//
//  ViewController.swift
//  StylerDurden
//
//  Created by Emmanuel Garsd on 6/1/18.
//  Copyright © 2018 garsd. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  private let styles: Styles
  
  private var titleLabel = UILabel()
  private var subtitleLabel = UILabel()
  
  init(styles: Styles) {
    self.styles = styles
    
    super.init(nibName: nil, bundle: nil)
    styles.delegates.addDelegate(self)
  }
  
  required init?(coder aDecoder: NSCoder) { fatalError("Not implemented") }
  
  override func loadView() {
    render()
    apply(styles: styles)
  }
}

extension ViewController {
  func render() {
    titleLabel.text = "Stylin'"
    subtitleLabel.text = "The things you own\n end up owning you"
    
    let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
    stackView.alignment = .center
    stackView.axis = .vertical
    stackView.setCustomSpacing(8, after: titleLabel)
    
    view = UIView()
    view.addSubview(stackView)
    
    stackView.snp.makeConstraints { (make) in
      make.centerY.equalToSuperview()
      make.centerX.equalToSuperview()
    }
  }
  
  func apply(styles: Styles) {
    titleLabel.sd.apply([styles.title])
    subtitleLabel.sd.apply([styles.subtitle])
    view.sd.apply([styles.defaultBackground])
  }
}

extension ViewController: StylesDelegate {
  func updated(styles: Styles) {
    UIView.animate(withDuration: 0.2) {
      self.apply(styles: styles)
    }
  }
}


extension ViewController {
  @objc func injected() {
    render()
    apply(styles: styles)
  }
}
