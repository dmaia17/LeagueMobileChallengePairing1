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
    guard let pathString = Bundle(for: type(of: self)).path(forResource: mockSuccessFile, ofType: "json") else {
      fatalError("\(mockSuccessFile).json not found")
    }
    
    guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
      fatalError("Unable to convert \(mockSuccessFile) to String")
    }
    
    mockSuccess = T.parse(textData: jsonString as String)
  }
}
