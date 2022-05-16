//
//  LCMProviderMock.swift
//  LeagueMobileChallengePairingTests
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import XCTest
@testable import LeagueMobileChallengePairing

class LCMProviderMock<T: Decodable>: BaseProviderMock<T> {
  init(mockSuccess: SuccessMockType) {
    super.init(mockSuccessFile: mockSuccess.rawValue)
  }
}

extension LCMProviderMock: LMCProviderProtocol {
  func getLogin(successCallback: @escaping (LoginResponseModel) -> Void, failureCallback: @escaping () -> Void) {
    if let mock = mockSuccess, let parsedMock = mock as? LoginResponseModel {
      successCallback(parsedMock)
    } else {
      failureCallback()
    }
  }
  
  func getUsers(apiKey: String, successCallback: @escaping ([UserResponseModel]) -> Void, failureCallback: @escaping () -> Void) {
    
  }
  
  func getPosts(apiKey: String, userId: Int, successCallback: @escaping ([PostResponseModel]) -> Void, failureCallback: @escaping () -> Void) {
    
  }
}
