//
//  UserResponseModel.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

struct UserResponseModel: Codable {
  var id: Int = 0
  var avatar: AvatarModel = AvatarModel.init()
  var username: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
    self.avatar = try container.decodeIfPresent(AvatarModel.self, forKey: .avatar) ?? AvatarModel.init()
    self.username = try container.decodeIfPresent(String.self, forKey: .username) ?? ""
  }
}

struct AvatarModel: Codable {
  var thumbnail: String = ""
  
  init() {}
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
  }
}
