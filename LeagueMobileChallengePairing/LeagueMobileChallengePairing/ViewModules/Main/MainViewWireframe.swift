//
//  MainViewWireframe.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

final class MainViewWireframe: BaseWireframe {
  
  // MARK: - Private properties

  private let moduleViewController = MainViewViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup

  func configureModule(with viewController: MainViewViewController) {
    let interactor = MainViewInteractor()
    let presenter = MainViewPresenter(wireframe: self, view: viewController, interactor: interactor)
    
    interactor.delegate = presenter
    viewController.presenter = presenter
  }
  
  // MARK: - Transitions

  func show(with transition: Transition, animated: Bool = true) {
    configureModule(with: moduleViewController)
    show(moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing

}

// MARK: - Extensions

extension MainViewWireframe: MainViewWireframeInterface {
  func navigate(to option: MainViewNavigationOption) {
    // switch option {
    // case <#pattern#>:
    //   <#code#>      
    // }
  }
}
