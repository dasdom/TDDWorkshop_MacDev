//  Created by dasdom on 23.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import Foundation

protocol APIClientProtocol {
  func currentComic(completion: (Comic)->Void)
  func comic(id: Int, completion: (Comic?, Error?)->Void)
  func imageData(url: URL, completion: (Data?, Error?)->Void)
}
