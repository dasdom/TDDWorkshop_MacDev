//  Created by dasdom on 01.12.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import Foundation
@testable import XKCDBrowser01

enum TestComics {
  static func comic(id: Int, title: String = "a", img: String = "b") -> Comic {
    return Comic(alt: "a",
                 day: "22",
                 img: img,
                 link: "",
                 month: "11",
                 news: "",
                 num: id,
                 safe_title: "c",
                 title: title,
                 transcript: "",
                 year: "2019")
  }
}
