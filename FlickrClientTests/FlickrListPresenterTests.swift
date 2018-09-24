//
//  FlickrListPresenterTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class FlickrListPresenterTests: XCTestCase {
    
    var presenter: DefaultFlickrListPresenter!
    var mockInteractor = MockInteractor()
    var mockView = MockFlickrView()
    
    override func setUp() {
        super.setUp()
        
        presenter = DefaultFlickrListPresenter()
        presenter.interactor = mockInteractor
        presenter.view = mockView
    }
    
    override func tearDown() {
        
        presenter = nil
        
        super.tearDown()
    }

    func test_calls_fetchList_onViewReady() {
        presenter.viewReady()
        
        XCTAssertEqual(mockInteractor.fetchListInvocations, 1)
    }
    
    func test_calls_refresh_onListFetched() {
        presenter.didFetchFeed(list: FlickrResponse(title: "", items: []))
        
        XCTAssertEqual(mockView.refreshInvocations, 1)
    }
    
    func test_setupCells_assignsValues() {
        let cell = MockFlickrCell()
        let photo = FlickrPhoto(title: "title 1",
                                date: "date 1",
                                published: "published 1",
                                author: "author 1",
                                authorId: "authorid 1",
                                tags: "tags 1",
                                media: FlickrPhotoMedia(imageUrl: ""))
        
        let photo2 = FlickrPhoto(title: "title 2",
                                date: "date 2",
                                published: "published 2",
                                author: "author 2",
                                authorId: "authorid 2",
                                tags: "tags 2",
                                media: FlickrPhotoMedia(imageUrl: ""))

        
        presenter.didFetchFeed(list: FlickrResponse(title: "", items: [photo, photo2]))
        
        presenter.setup(cell: cell, at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.titleLabel.text, "title 1")
        XCTAssertEqual(cell.dateLabel.text, "Date taken: date 1")
        XCTAssertEqual(cell.publishedLabel.text, "Published on: published 1")
        XCTAssertEqual(cell.authorLabel.text, "author 1")
        XCTAssertEqual(cell.authorIdLabel.text, "authorid 1")
        XCTAssertEqual(cell.tagsLabel.text, "tags 1")
        
        presenter.setup(cell: cell, at: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(cell.titleLabel.text, "title 2")
        XCTAssertEqual(cell.dateLabel.text, "Date taken: date 2")
        XCTAssertEqual(cell.publishedLabel.text, "Published on: published 2")
        XCTAssertEqual(cell.authorLabel.text, "author 2")
        XCTAssertEqual(cell.authorIdLabel.text, "authorid 2")
        XCTAssertEqual(cell.tagsLabel.text, "tags 2")

    }
}




