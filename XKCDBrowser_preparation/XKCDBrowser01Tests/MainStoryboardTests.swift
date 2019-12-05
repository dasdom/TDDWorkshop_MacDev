//  Created by dasdom on 12.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import XCTest
@testable import XKCDBrowser01

class MainStoryboardTests: XCTestCase {

  func test_initialViewController_isComicNumberTableViewController() {
    // given main storyboard
    let sut = UIStoryboard(name: "Main", bundle: nil)
    
    // when loading initial view controller
    let initialViewController = sut.instantiateInitialViewController()
    
    // then it's an instance of ComicNumberTableViewController
    let navigationController = initialViewController as! UINavigationController
    XCTAssertTrue(navigationController.topViewController is ComicNumbersTableViewController)
  }
}
