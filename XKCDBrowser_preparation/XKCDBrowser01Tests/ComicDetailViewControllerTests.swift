//  Created by dasdom on 01.12.19.
//  Copyright © 2019 dasdom. All rights reserved.
//

import XCTest
import Nimble
@testable import XKCDBrowser01

class ComicDetailViewControllerTests: XCTestCase {

  var sut: ComicDetailViewController!
  
  override func setUp() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    sut = storyboard.instantiateViewController(identifier: "ComicDetailViewController", creator: { coder in
      ComicDetailViewController(coder: coder, comicId: 42)
    })
  }
  
  override func tearDown() {
    sut = nil
  }
  
  func test_loadsView() {
    // when view is loaded
    sut.loadViewIfNeeded()
    
    // then view is ComicDetailView
    expect(self.sut.view).to(beAKindOf(ComicDetailView.self))
  }
  
  func test_loadingView_fetchesComic() {
    // given apiClient is mocked
    let mockAPIClient = MockAPIClient(comicToReturn: TestComics.comic(id: 23, title: "Foobar"))
    sut.apiClient = mockAPIClient
    
    // when view is loaded
    sut.loadViewIfNeeded()
    
    // then loaded comic id is comicId
    expect(mockAPIClient.fetchedComicId).to(equal(42))
  }
  
  func test_loadingView_setsTitleLabel() {
    // given apiClient is mocked
    let mockAPIClient = MockAPIClient(comicToReturn: TestComics.comic(id: 23, title: "Foobar"))
    sut.apiClient = mockAPIClient
    
    // when view is loaded
    sut.loadViewIfNeeded()
    
    // then loaded comic id is comicId
    let view = sut.view as! ComicDetailView
    expect(view.titleLabel.text).to(equal("Foobar"))
  }
  
  func test_loadingView_fetchesImage() {
    let mockAPIClient = MockAPIClient(comicToReturn: TestComics.comic(id: 23, img: "foo"))
    sut.apiClient = mockAPIClient
    
    sut.loadViewIfNeeded()
    
    expect(mockAPIClient.imageURL).to(equal(URL(string: "foo")))
  }
  
  func test_loadingView_setsImage() {
    let mockAPIClient = MockAPIClient(comicToReturn: TestComics.comic(id: 23, img: "foo"))
    sut.apiClient = mockAPIClient
    
    sut.loadViewIfNeeded()
    
    let view = sut.view as! ComicDetailView
    expect(view.imageView.image).notTo(beNil())
  }
}
