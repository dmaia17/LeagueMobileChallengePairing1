//
//  LCMTests.swift
//  LeagueMobileChallengePairingTests
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import XCTest
@testable import LeagueMobileChallengePairing

enum SuccessMockType: String {
  case loginSuccess = "LoginMock"
  case userSuccess = "UserMock"
  case postSuccess = "PostMock"
}

class LCMTests: XCTestCase {
  
  func configureProvider<T: Decodable>(_: T.Type, mockSuccess: SuccessMockType) -> LMCProviderProtocol {
    return LCMProviderMock<T>(mockSuccess: mockSuccess)
  }
  
  func testGetApyKey() {
    let apiKey = "5ECDDC3A21CE53428227A2125B7FCC71"
    let provider = configureProvider(LoginResponseModel.self, mockSuccess: .loginSuccess)
    var loginModel = LoginResponseModel.init()
    
    provider.getLogin(successCallback: { login in
      loginModel = login
    }, failureCallback: {
      XCTFail("Failure - Couldn't get data")
    })
    
    XCTAssertTrue(loginModel.api_key == apiKey)
  }
  
  func testGetUserId1() {
    let userId = 1
    let provider = configureProvider([UserResponseModel].self, mockSuccess: .userSuccess)
    var user = UserResponseModel.init()
    
    provider.getUsers(apiKey: "", successCallback: { users in
      user = users[0]
    }, failureCallback: {
      XCTFail("Failure - Couldn't get data")
    })
    
    XCTAssertTrue(user.id == userId)
  }
  
  func testGetPostId26() {
    let postId = 26
    let provider = configureProvider([PostResponseModel].self, mockSuccess: .postSuccess)
    var post = PostResponseModel.init()
    
    provider.getPosts(apiKey: "", userId: 1, successCallback: { posts in
      post = posts[0]
    }, failureCallback: {
      XCTFail("Failure - Couldn't get data")
    })
    
    XCTAssertTrue(post.id == postId)
  }
}
