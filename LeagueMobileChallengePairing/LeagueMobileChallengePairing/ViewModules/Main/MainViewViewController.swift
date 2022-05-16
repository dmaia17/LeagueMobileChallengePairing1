//
//  MainViewViewController.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

final class MainViewViewController: UIViewController, WhiteNavigationTheme {
  
  // MARK: - Outlets
  
  // MARK: - Class properties
  
  // MARK: - Public properties  

  var presenter: MainViewPresenterInterface!
  
  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewConfiguration()
  }
  
  // MARK: - Class Configurations  

  private func viewConfiguration() {
    title = presenter.navTitle
  }

  // MARK: - UIActions

  // MARK: - Class Methods
  
}

// MARK: - Extensions

extension MainViewViewController: MainViewViewInterface { }
