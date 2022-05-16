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
  
  /**
   * Endpoint: https://engineering.league.dev/challenge/api/login
   * Type: GET
   */
  func getUsers(apiKey: String, successCallback: @escaping ([UserResponseModel]) -> Void, failureCallback: @escaping () -> Void)
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
  
  func getUsers(apiKey: String, successCallback: @escaping ([UserResponseModel]) -> Void, failureCallback: @escaping () -> Void) {
    let headers: HTTPHeaders = ["x-access-token": apiKey]
    
    AF.request("https://engineering.league.dev/challenge/api/users", headers: headers)
      .validate()
      .responseDecodable(of: [UserResponseModel].self) { response in
        guard let response = response.value else {
          failureCallback()
          return
        }
        print(response)
        successCallback(response)
      }
  }
}
