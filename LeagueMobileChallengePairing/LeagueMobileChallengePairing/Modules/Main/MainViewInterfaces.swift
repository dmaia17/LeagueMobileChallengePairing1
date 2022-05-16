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

protocol MainViewViewInterface: ViewInterface {
  func reloadTableView()
}

protocol MainViewPresenterInterface: PresenterInterface {
  var navTitle: String { get }
  
  ///TableView
  func numberOfItens(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  func cellForIndex(index: IndexPath, tableView:UITableView) -> UITableViewCell
}

protocol MainViewInteractorProtocol: AnyObject {
  func getPosts()
}

protocol MainViewInteractorResponseProtocol: AnyObject {
  func getPostsSuccess(list: [PostModel])
  func getPostsError()
}
