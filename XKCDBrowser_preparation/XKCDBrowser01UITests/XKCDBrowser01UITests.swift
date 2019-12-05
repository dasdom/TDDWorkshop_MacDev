//  Created by dasdom on 03.12.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import XCTest

class XKCDBrowser01UITests: XCTestCase {

  func test_foo() {
    
    let app = XCUIApplication()
    app.launch()
    
    let cell23 = app.tables.staticTexts["23"]

    cell23.tap()
    
    app.navigationBars["XKCDBrowser01.ComicDetailView"].buttons["Back"].tap()
            
  }
}
