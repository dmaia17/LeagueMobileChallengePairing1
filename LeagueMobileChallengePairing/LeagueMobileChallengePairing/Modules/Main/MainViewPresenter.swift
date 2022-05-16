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
  private var posts: [PostModel] = []
  
  // MARK: - Lifecycle

  init(wireframe: MainViewWireframeInterface, view: MainViewViewInterface, interactor: MainViewInteractorProtocol) {
    self.wireframe = wireframe
    self.view = view
    self.interactor = interactor
  }
}

// MARK: - Extensions

extension MainViewPresenter: MainViewPresenterInterface {
  func viewDidLoad() {
    view?.fullScreenLoading(hide: false)
    interactor.getPosts()
  }
  
  func numberOfItens(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    posts.count
  }
  
  func cellForIndex(index: IndexPath, tableView: UITableView) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.cellIdentifier, for: index) as? MainTableViewCell else {
      return UITableViewCell()
    }
    
    cell.setup(post: posts[index.row])
    cell.selectionStyle = .none
    return cell
  }
}

extension MainViewPresenter: MainViewInteractorResponseProtocol {
  func getPostsSuccess(list: [PostModel]) {
    posts = list
    view?.reloadTableView()
    view?.fullScreenLoading(hide: true)
  }
  
  func getPostsError() {
    view?.fullScreenLoading(hide: true)
  }
}
