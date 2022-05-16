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
  
  private func getUsers(apiKey: String) {
    provider?.getUsers(apiKey: apiKey, successCallback: { [weak self] users in
      self?.getPosts(apiKey: apiKey, users: users)
    }, failureCallback: {
      self.delegate?.getPostsError()
    })
  }
  
  private func getPosts(apiKey: String, users: [UserResponseModel]) {
    var postList: [PostModel] = []
    let group = DispatchGroup()
    
    for user in users {
      group.enter()
      provider?.getPosts(apiKey: apiKey, userId: user.id, successCallback: { posts in
        
        for post in posts {
          var p = PostModel.init()
          
          p.icon = user.avatar.thumbnail
          p.name = user.username
          p.title = post.title
          p.description = post.body
          
          postList.append(p)
        }
        
        group.leave()
      }, failureCallback: {
        group.leave()
      })
    }
    
    group.notify(queue: .main) {
      self.delegate?.getPostsSuccess(list: postList)
    }
  }
}

// MARK: - Extensions

extension MainViewInteractor: MainViewInteractorProtocol {
  func getPosts() {
    provider?.getLogin(successCallback: { [weak self] login in
      self?.getUsers(apiKey: login.api_key)
    }, failureCallback: {
      self.delegate?.getPostsError()
    })
  }
}

