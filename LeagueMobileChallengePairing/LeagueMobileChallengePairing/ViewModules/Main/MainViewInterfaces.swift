//
//  MainViewInterfaces.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import UIKit

enum MainViewNavigationOption { }

protocol MainViewWireframeInterface: AnyObject {
  func navigate(to option: MainViewNavigationOption)
}

protocol MainViewViewInterface: ViewInterface { }

protocol MainViewPresenterInterface: PresenterInterface {
  var navTitle: String { get }
}

protocol MainViewInteractorProtocol: AnyObject { }
