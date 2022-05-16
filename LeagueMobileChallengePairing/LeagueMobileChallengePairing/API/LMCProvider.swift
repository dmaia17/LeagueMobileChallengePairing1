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
  
  /**
   * Endpoint: https://engineering.league.dev/challenge/api/posts
   * Type: GET
   */
  func getPosts(apiKey: String, userId: Int, successCallback: @escaping ([PostResponseModel]) -> Void, failureCallback: @escaping () -> Void)
}

class LMCProvider {
  private func createHeader(apiKey: String) -> HTTPHeaders {
    return ["x-access-token": apiKey]
  }
}

extension LMCProvider: LMCProviderProtocol {
  func getLogin(successCallback: @escaping (LoginResponseModel) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://engineering.league.dev/challenge/api/login")
      .validate()
      .responseDecodable(of: LoginResponseModel.self) { response in
        guard let login = response.value else {
          print(response)
          failureCallback()
          return
        }
        successCallback(login)
      }
  }
  
  func getUsers(apiKey: String, successCallback: @escaping ([UserResponseModel]) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://engineering.league.dev/challenge/api/users", headers: createHeader(apiKey: apiKey))
      .validate()
      .responseDecodable(of: [UserResponseModel].self) { response in
        guard let response = response.value else {
          print(response)
          failureCallback()
          return
        }
        successCallback(response)
      }
  }
  
  func getPosts(apiKey: String, userId: Int, successCallback: @escaping ([PostResponseModel]) -> Void, failureCallback: @escaping () -> Void) {
    AF.request("https://engineering.league.dev/challenge/api/posts?userId=\(userId)", headers: createHeader(apiKey: apiKey))
      .validate()
      .responseDecodable(of: [PostResponseModel].self) { response in
        guard let response = response.value else {
          print(response)
          failureCallback()
          return
        }
        successCallback(response)
      }
  }
}
