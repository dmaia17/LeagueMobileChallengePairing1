//
//  WhiteNavigationTheme.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

public protocol WhiteNavigationTheme: Themeable { }

public extension WhiteNavigationTheme {
  var navigationBarBackgroundColor: UIColor {
    return .white
  }
  
  var navigationBarTintColor: UIColor {
    return .blue
  }
  
  var navigationTitleTextAttributes: [NSAttributedString.Key: Any] {
    return [.foregroundColor: UIColor.black]
  }
  
  var navigationBarStyle: UIBarStyle {
    return .black
  }
  
  var navigationBarTranslucent: Bool {
    return false
  }
}

