//
//  MainViewPresenter.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

final class MainViewPresenter {

  // MARK: - Enums

  enum Strings {
    static let title = "Posts"
  }

  // MARK: - Private properties  

  private weak var view: MainViewViewInterface?
  private let interactor: MainViewInteractorProtocol
  private let wireframe: MainViewWireframeInterface
  
  let navTitle = Strings.title
    
  // MARK: - Lifecycle

  init(wireframe: MainViewWireframeInterface, view: MainViewViewInterface, interactor: MainViewInteractorProtocol) {
    self.wireframe = wireframe
    self.view = view
    self.interactor = interactor
  }
}

// MARK: - Extensions

extension MainViewPresenter: MainViewPresenterInterface { }
