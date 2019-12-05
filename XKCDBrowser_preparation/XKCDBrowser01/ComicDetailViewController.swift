//  Created by dasdom on 23.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import UIKit

class ComicDetailViewController: UIViewController {

  let comicId: Int
  lazy var apiClient: APIClientProtocol = APIClient()
  var comic: Comic? {
    didSet {
      contentView.titleLabel.text = comic?.title
      
      guard let comic = comic else { fatalError() }
      fetchImage(for: comic)
    }
  }
  private var contentView: ComicDetailView {
    view as! ComicDetailView
  }
  
  // MARK: - Init
  init?(coder: NSCoder, comicId: Int) {
    self.comicId = comicId
    super.init(coder: coder)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View Cycle
  override func loadView() {
    let contentView = ComicDetailView()
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .yellow
    
    apiClient.comic(id: comicId) { [unowned self] comic, error in
      
      self.comic = comic
    }
  }
  
  // MARK: - Fetch image
  func fetchImage(for comic: Comic) {
    
    guard let url = URL(string: comic.img) else {
      return
    }
    
    apiClient.imageData(url: url) { [unowned self] imageData, error in
      
      self.contentView.imageData = imageData
    }
  }
}
