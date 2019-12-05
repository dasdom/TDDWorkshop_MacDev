//  Created by dasdom on 02.11.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import XCTest
@testable import XKCDBrowser01

class ComicNumbersTableViewControllerTests: XCTestCase {

  var sut: ComicNumbersTableViewController!
  
  override func setUp() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    sut = storyboard.instantiateViewController(withIdentifier: "ComicNumbersTableViewController") as? ComicNumbersTableViewController
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_loadingView_registersCell() {
    // when
    sut.loadViewIfNeeded()
    
    // then
    let cell = sut.tableView.dequeueReusableCell(withIdentifier: "ComicNumberCell", for: IndexPath(row: 0, section: 0))
    XCTAssertNotNil(cell)
    XCTAssertTrue(cell is ComicNumberCell)
  }
  
  func test_numberOfRows_initial() {
    // when
    let numberOfRows = sut.tableView.numberOfRows(inSection: 0)
    
    // then
    XCTAssertEqual(0, numberOfRows)
  }
  
  func test_numberOfRows() {
    // given
    sut.numberOfComics = 23
    
    // when
    let numberOfRows = sut.tableView.numberOfRows(inSection: 0)
    
    // then
    XCTAssertEqual(23, numberOfRows)
  }
  
  func test_cellForRow_dequeuesCell() {
    // given
    let mockTableView = TableViewMock()
    
    // when
    let indexPath = IndexPath(row: 0, section: 0)
    _ = sut.tableView(mockTableView, cellForRowAt: indexPath)
    
    // then
    XCTAssertEqual(mockTableView.dequeueReusableCellCalls["ComicNumberCell"], 1)
  }
  
  func test_cellForRow_callsUpdateOfCell() {
    // given
    sut.tableView.register(ComicNumberCellMock.self, forCellReuseIdentifier: "ComicNumberCell")
    sut.numberOfComics = 42
    
    // when
    let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! ComicNumberCellMock
    
    // then
    XCTAssertEqual(42, cell.lastNumber)
  }
  
  func test_didSelectRow_pushesDetail() {
    sut.numberOfComics = 42
    let mockNavigationController = NavigationControllerMock(rootViewController: sut)

    sut.tableView.delegate?.tableView?(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
    
    let comicDetailViewController = mockNavigationController.lastPushedViewController as! ComicDetailViewController
    XCTAssertEqual(42, comicDetailViewController.comicId)
  }
  
  func test_viewDidLoad_fetchesLatestComic() {
    // given an apiClient is set
    let mockApiClient = MockAPIClient(comicToReturn: TestComics.comic(id: 23))
    sut.apiClient = mockApiClient
    let mockTableView = MockTableView()
    sut.tableView = mockTableView
    
    // when view appeared
    sut.beginAppearanceTransition(true, animated: false)
    sut.endAppearanceTransition()
    
    // then current comic is fetched
    XCTAssertEqual(1, mockApiClient.currentComicCallCount)
    XCTAssertEqual(23, sut.numberOfComics)
    XCTAssertEqual(1, mockTableView.reloadDataCalls)
  }
  
  func test_init_setsAPIClient() {
    XCTAssertNotNil(sut.apiClient)
  }
}

// MARK: - Helpers
extension ComicNumbersTableViewControllerTests {
  
  class TableViewMock : UITableView {
    
    var dequeueReusableCellCalls: [String:Int] = [:]

    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
      
      var numberOfCalls = dequeueReusableCellCalls[identifier] ?? 0
      numberOfCalls += 1
      dequeueReusableCellCalls[identifier] = numberOfCalls
      
      return ComicNumberCell()
    }
  }
  
  class ComicNumberCellMock : ComicNumberCell {
    
    var lastNumber: Int?
    
    override func update(with number: Int) {
      lastNumber = number
    }
  }
  
  class NavigationControllerMock : UINavigationController {
    
    var lastPushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
      
      lastPushedViewController = viewController
      super.pushViewController(viewController, animated: animated)
    }
  }
  
  class MockTableView : UITableView {
    
    var reloadDataCalls = 0
    
    override func reloadData() {
      reloadDataCalls += 1
      super.reloadData()
    }
  }
}
