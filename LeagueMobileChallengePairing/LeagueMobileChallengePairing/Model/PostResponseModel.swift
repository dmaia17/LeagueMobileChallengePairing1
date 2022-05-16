//
//  PostResponseModel.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

struct PostResponseModel: Codable {
  var userId: Int = 0
  var id: Int = 0
  var title: String = ""
  var body: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.userId = try container.decodeIfPresent(Int.self, forKey: .userId) ?? 0
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    self.body = try container.decodeIfPresent(String.self, forKey: .body) ?? ""
  }
}
