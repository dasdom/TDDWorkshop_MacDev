//  Created by dasdom on 03.12.19.
//  
//

import XCTest
@testable import TTDDemo

class LiteralCalculatorTests : XCTestCase {
  
  func test_calucateOnePlusOne_isTwo() {
    let caluclator = LiteralCalculator()
    
    let result = caluclator.calculate("one plus one")
    
    XCTAssertEqual("two", result)
  }
  
  func test_calucateOnePlusTwo_isThree() {
    let caluclator = LiteralCalculator()
    
    let result = caluclator.calculate("one plus two")
    
    XCTAssertEqual("three", result)
  }
  
  func test_calucateOneMinusOne_isZero() {
    let caluclator = LiteralCalculator()
    
    let result = caluclator.calculate("one minus one")
    
    XCTAssertEqual("zero", result)
  }
}

