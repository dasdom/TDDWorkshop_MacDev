//  Created by dasdom on 02.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import UIKit

class ComicNumberCell: UITableViewCell {

  func update(with number: Int) {
    textLabel?.text = "\(number)"
  }

}
