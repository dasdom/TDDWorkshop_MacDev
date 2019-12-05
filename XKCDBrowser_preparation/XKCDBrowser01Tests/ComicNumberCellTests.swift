//  Created by dasdom on 12.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import XCTest
@testable import XKCDBrowser01

class ComicNumberCellTests: XCTestCase {

  var sut: ComicNumberCell!
  
  override func setUp() {
    sut = ComicNumberCell()
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_update_setText() {
    // when update is called
    sut.update(with: 23)
    
    // then number is set to label
    XCTAssertEqual("23", sut.textLabel?.text)
  }
}
