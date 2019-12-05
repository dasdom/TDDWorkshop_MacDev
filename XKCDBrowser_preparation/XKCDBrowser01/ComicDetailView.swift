//  Created by dasdom on 01.12.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import UIKit

class ComicDetailView: UIView {

  let titleLabel = UILabel()
  let imageView = UIImageView()
  var imageData: Data? {
    didSet {
      if let imageData = imageData {
        imageView.image = UIImage(data: imageData)
      }
    }
  }
}
