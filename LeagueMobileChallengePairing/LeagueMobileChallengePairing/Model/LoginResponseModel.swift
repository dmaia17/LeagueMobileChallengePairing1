//
//  LoginResponseModel.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

struct LoginResponseModel: Codable {
  var api_key: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.api_key = try container.decodeIfPresent(String.self, forKey: .api_key) ?? ""
  }
}
