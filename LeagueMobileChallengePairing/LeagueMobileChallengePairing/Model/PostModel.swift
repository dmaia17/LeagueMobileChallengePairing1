//
//  PostModel.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

struct PostModel: Codable {
  var icon: String = ""
  var name: String = ""
  var title: String = ""
  var description: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.icon = try container.decodeIfPresent(String.self, forKey: .icon) ?? ""
    self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
    self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
    self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
  }
}
