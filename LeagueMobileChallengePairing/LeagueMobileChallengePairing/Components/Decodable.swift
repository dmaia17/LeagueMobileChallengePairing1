//
//  Decodable.swift
//  LeagueMobileChallengePairing
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

extension Decodable {
  static func parse(jsonFile: String) -> Self? {
    guard let url = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
      let data = try? Data(contentsOf: url),
      let output = try? JSONDecoder().decode(self, from: data)
      else {
        return nil
    }
    
    return output
  }
  
  static func parse(dic: [String: Any]) -> Self? {
    do {
      let jsonData = try JSONSerialization.data(withJSONObject: dic, options: [])
      let result = try JSONDecoder().decode(self, from: jsonData)
      return result
    } catch let ex {
      print("parse error: \(ex)")
      return nil
    }
  }
  
  static func parse(array: NSArray) -> Self? {
    do {
      let jsonData = try JSONSerialization.data(withJSONObject: array, options: [])
      let result = try JSONDecoder().decode(self, from: jsonData)
      return result
    } catch let ex {
      print("parse error: \(ex)")
      return nil
    }
  }
  
  static func parse(textData: String) -> Self? {
    do {
      guard let jsonData = textData.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
      let result = try JSONDecoder().decode(self, from: jsonData)
      return result
    } catch let ex {
      print("parse error: \(ex)")
      return nil
    }
  }
}
