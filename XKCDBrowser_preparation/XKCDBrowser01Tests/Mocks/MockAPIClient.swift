//  Created by dasdom on 01.12.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import UIKit
@testable import XKCDBrowser01

class MockAPIClient : APIClientProtocol {
  
  var currentComicCallCount = 0
  var comicToReturn: Comic?
  var fetchedComicId: Int?
  var imageURL: URL?
  
  init(comicToReturn: Comic) {
    self.comicToReturn = comicToReturn
  }
  
  func currentComic(completion: (Comic) -> Void) {
    currentComicCallCount += 1
    if let comic = comicToReturn {
      completion(comic)
    }
  }

  func comic(id: Int, completion: (Comic?, Error?) -> Void) {
    fetchedComicId = id
    completion(comicToReturn, nil)
  }

  func imageData(url: URL, completion: (Data?, Error?) -> Void) {
    imageURL = url
    
    guard let url = Bundle(for: MockAPIClient.self).url(forResource: "small", withExtension: "png") else {
      fatalError()
    }
    let data = try? Data(contentsOf: url)
    completion(data, nil)
  }
}
