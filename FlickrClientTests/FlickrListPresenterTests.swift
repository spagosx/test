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

}

