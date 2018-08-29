//
//  FlickrListInteractorTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class FlickrListInteractorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_calls_network() {
        
        let mockNetwork = MockNetwork()
        let interactor = DefaultFlickrListInteractor(networkManager: mockNetwork)
        
        interactor.fetchList()
        
        XCTAssertEqual(mockNetwork.fetchFromInvocations.count, 1)
    }
}


