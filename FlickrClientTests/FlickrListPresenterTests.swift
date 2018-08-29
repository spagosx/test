//
//  FlickrListPresenterTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class FlickrListPresenterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_calls_fetchList_onViewReady() {
        let presenter = DefaultFlickrListPresenter()
        let mockInteractor = MockInteractor()
        presenter.interactor = mockInteractor
        
        presenter.viewReady()
        
        XCTAssertEqual(mockInteractor.fetchListInvocations, 1)
    }
    
    func test_calls_refresh_onListFetched() {
        let presenter = DefaultFlickrListPresenter()
        let mockView = MockFlickrView()
        presenter.view = mockView
        
        presenter.didFetchFeed(list: FlickrResponse(title: "", items: []))
        
        XCTAssertEqual(mockView.refreshInvocations, 1)
    }
    
    func test_setupCells_assignsValues() {
        let presenter = DefaultFlickrListPresenter()
        let cell = MockFlickrCell()
        let photo = FlickrPhoto(title: "title 1",
                                date: "date 1",
                                published: "published 1",
                                author: "author 1",
                                authorId: "authorid 1",
                                tags: "tags 1",
                                media: FlickrPhotoMedia(imageUrl: ""))
        presenter.didFetchFeed(list: FlickrResponse(title: "", items: [photo]))
        presenter.setup(cell: cell, at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.titleLabel.text, "title 1")
        XCTAssertEqual(cell.dateLabel.text, "Date taken: date 1")
        XCTAssertEqual(cell.publishedLabel.text, "Published on: published 1")
        XCTAssertEqual(cell.authorLabel.text, "author 1")
        XCTAssertEqual(cell.authorIdLabel.text, "authorid 1")
        XCTAssertEqual(cell.tagsLabel.text, "tags 1")
    }
}

class MockFlickrCell: ConfigurablePhotoCell {
    var photoImageView: UIImageView! = UIImageView()
    var titleLabel: UILabel! = UILabel()
    var dateLabel: UILabel! = UILabel()
    var publishedLabel: UILabel! = UILabel()
    var authorLabel: UILabel! = UILabel()
    var authorIdLabel: UILabel! = UILabel()
    var tagsLabel: UILabel! = UILabel()
}


