//
//  LMCUINavigationController.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

public protocol Themeable {
  var navigationBarBackgroundColor: UIColor { get }
  var navigationBarTintColor: UIColor { get }
  var navigationTitleTextAttributes: [NSAttributedString.Key : Any] { get }
  var navigationBarStyle: UIBarStyle { get }
  var navigationBarTranslucent: Bool { get }
}

public class LMCUINavigationController: UINavigationController {
  
  // MARK: - Properties
  
  override public func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Lifecycle
  required convenience init() {
    self.init(navigationBarClass: nil, toolbarClass: nil)
  }
  
  override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
    super.pushViewController(viewController, animated: animated)
    styleViewController(viewController: viewController)
  }
  
  private func styleViewController(viewController: UIViewController?) {
    if let vc = viewController as? Themeable {
      if #available(iOS 15, *) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = vc.navigationTitleTextAttributes
        appearance.backgroundColor = vc.navigationBarBackgroundColor
        appearance.shadowColor = .clear
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
      }
      
      self.setNeedsStatusBarAppearanceUpdate()
      self.navigationBar.isTranslucent = vc.navigationBarTranslucent
      self.navigationBar.barTintColor = vc.navigationBarBackgroundColor
      self.navigationBar.tintColor = vc.navigationBarTintColor
      self.navigationBar.titleTextAttributes = vc.navigationTitleTextAttributes
    }
  }
}

