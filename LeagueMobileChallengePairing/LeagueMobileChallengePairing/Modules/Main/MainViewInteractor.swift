//
//  MainViewInteractor.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

final class MainViewInteractor {
  
  weak var delegate: MainViewInteractorResponseProtocol?
  var provider: LMCProviderProtocol?
  
  private func createMock() -> [PostModel] {
    var posts: [PostModel] = []
    
    var p1 = PostModel.init()
    p1.icon = "http://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png"
    p1.name = "Nome 1"
    p1.title = "title 1"
    p1.description = "description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 description1 "
    
    var p2 = PostModel.init()
    p2.icon = "http://cbissn.ibict.br/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png"
    p2.name = "Nome 2"
    p2.title = "title 2"
    p2.description = "description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 description2 "
    
    posts.append(p1)
    posts.append(p2)
    
    return posts
  }
  
  private func getUsers(apiKey: String) {
    
    provider?.getUsers(apiKey: apiKey, successCallback: { [weak self] users in
      self?.getPosts(apiKey: apiKey, userId: users[0].id)
    }, failureCallback: {
      print("ERROR ON INTERACTOR")
    })
  }
  
  private func getPosts(apiKey: String, userId: Int) {
    provider?.getPosts(apiKey: apiKey, userId: userId, successCallback: { posts in
      print(posts)
    }, failureCallback: {
      print("ERROR ON INTERACTOR")
    })
  }
}

// MARK: - Extensions

extension MainViewInteractor: MainViewInteractorProtocol {
  func getPosts() {
    delegate?.getPostsSuccess(list: createMock())
    
    provider?.getLogin(successCallback: { [weak self] login in
      self?.getUsers(apiKey: login.api_key)
    }, failureCallback: {
      print("ERROR ON INTERACTOR")
    })
  }
}

