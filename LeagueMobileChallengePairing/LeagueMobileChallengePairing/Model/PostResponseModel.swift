//
//  PostResponseModel.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

struct PostResponseModel: Codable {
  var userId: String = ""
  var id: String = ""
  var title: String = ""
  var body: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.userId = try container.decodeIfPresent(String.self, forKey: .userId) ?? ""
    self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
    self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    self.body = try container.decodeIfPresent(String.self, forKey: .body) ?? ""
  }
}
