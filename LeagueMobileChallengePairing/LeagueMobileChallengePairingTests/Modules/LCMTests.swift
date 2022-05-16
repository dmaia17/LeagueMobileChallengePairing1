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
}

class LCMTests: XCTestCase {
  
  func configureProvider<T: Decodable>(_: T.Type, mockSuccess: SuccessMockType) -> LMCProviderProtocol {
    return LCMProviderMock<T>(mockSuccess: mockSuccess)
  }
  
  func testGetApyKey() {
    let provider = configureProvider(LoginResponseModel.self, mockSuccess: .loginSuccess)
    var loginModel = LoginResponseModel.init()
    
    provider.getLogin(successCallback: { login in
      loginModel = login
    }, failureCallback: {
      XCTFail("Failure - Couldn't get data")
    })
    
    XCTAssertTrue(loginModel.api_key == "5ECDDC3A21CE53428227A2125B7FCC71")
  }
}
