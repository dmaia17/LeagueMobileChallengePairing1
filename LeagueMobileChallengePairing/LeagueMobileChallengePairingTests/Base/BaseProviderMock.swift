//
//  BaseProviderMock.swift
//  LeagueMobileChallengePairingTests
//
//  Created by Daniel Maia dos Passos on 16/05/22.
//

import Foundation

@testable import LeagueMobileChallengePairing

class BaseProviderMock<T: Decodable> {
  var mockSuccess: T?
  
  init(mockSuccessFile: String) {
    var dictionary: [String: Any] = [:]
    (dictionary, _) = getMockFrom(filePath: mockSuccessFile)
    mockSuccess = T.parse(dic: dictionary)
  }
  
  func getMockFrom(filePath: String) -> ([String: Any], AnyObject) {
    
    guard let pathString = Bundle(for: type(of: self)).path(forResource: filePath, ofType: "json") else {
      fatalError("\(filePath).json not found")
    }
    
    guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
      fatalError("Unable to convert \(filePath) to String")
    }
    
    guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
      fatalError("Unable to convert \(filePath) to NSData")
    }
        
    guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
      fatalError("Unable to convert \(filePath) to JSON dictionary")
    }
    
    return (jsonDictionary, jsonDictionary as AnyObject)
  }
}
