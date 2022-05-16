//
//  LMCProvider.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Alamofire

protocol LMCProviderProtocol {
  /**
   * Endpoint: https://engineering.league.dev/challenge/api/login
   * Type: GET
   */
  func getLogin(successCallback: @escaping (LoginResponseModel) -> Void, failureCallback: @escaping () -> Void)
}

class LMCProvider {
  
}

extension LMCProvider: LMCProviderProtocol {
  func getLogin(successCallback: @escaping (LoginResponseModel) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://engineering.league.dev/challenge/api/login")
      .validate()
      .responseDecodable(of: LoginResponseModel.self) { response in
        guard let login = response.value else {
          failureCallback()
          return
        }
        print(login)
        successCallback(login)
      }
  }
}
