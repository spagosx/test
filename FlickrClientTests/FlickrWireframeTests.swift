//
//  FlickrWireframeTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class FlickrWireframeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_wireUp() {
        let wireframe = FlickrWireframe()
        let mockView = MockFlickrView()
        wireframe.wireUp(view: mockView)
        XCTAssertTrue(mockView.presenter is DefaultFlickrListPresenter)
    }
}

class MockFlickrView: FlickrView {
    var presenter: FlickrListPresenter?
}
