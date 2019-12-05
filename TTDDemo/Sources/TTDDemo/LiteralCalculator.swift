//  Created by dasdom on 03.12.19.
//  
//

import Foundation

struct LiteralCalculator {
  
  func calculate(_ calculation: String) -> String {
    
    // components
    let components = calculation.components(separatedBy: "plus")
    
    guard let firstComponent = components.first,
      let lastComponent = components.last else {
        return ""
    }
    
    // String -> Int
    let firstDigit = firstComponent.ddh_int
    let lastDigit = lastComponent.ddh_int
    
    // calculate
    let result = firstDigit + lastDigit
    
    // Int -> String
    return result.ddh_string
  }
}

extension String {
  var ddh_int: Int {
    
    let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
    switch trimmed {
    case "one":
      return 1
    case "two":
      return 2
    default:
      return -1
    }
  }
}

extension Int {
  var ddh_string: String {
    switch self {
    case 2:
      return "two"
    case 3:
      return "three"
    default:
      return ""
    }
  }
}
