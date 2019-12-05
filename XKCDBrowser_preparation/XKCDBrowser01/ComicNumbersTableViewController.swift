//  Created by dasdom on 02.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import UIKit

class ComicNumbersTableViewController: UITableViewController {

  var numberOfComics = 42
  lazy var apiClient: APIClientProtocol = APIClient()
}

// MARK: - View Cycle
extension ComicNumbersTableViewController {
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    apiClient.currentComic { [unowned self] comic in
      self.numberOfComics = comic.num
      self.tableView.reloadData()
    }
  }
}

// MARK: - UITableViewDataSource
extension ComicNumbersTableViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return numberOfComics
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ComicNumberCell", for: indexPath) as! ComicNumberCell
    
    cell.update(with: numberOfComics-indexPath.row)
    
    return cell
  }
  
  // MARK: - UITableViewDelegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    showDetail(for: numberOfComics-indexPath.row)
  }
  
  func showDetail(for id: Int) {
    guard let next = storyboard?.instantiateViewController(identifier: "ComicDetailViewController", creator: { coder in
      ComicDetailViewController(coder: coder, comicId: id)
    }) else {
      fatalError()
    }
    navigationController?.pushViewController(next, animated: true)
  }
}
