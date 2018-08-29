//
//  FlickrNetworkTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class FlickrNetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_starts_task_on_session() {
        let mockSession = MockSession()
        let network = FlickrNetwork(session: mockSession)
        network.fetchFrom(urlString: "http://test.com") { (data, error) in
        }
        XCTAssertEqual(mockSession.startInvocations.count, 1)
        XCTAssertEqual(mockSession.startInvocations.first!.url?.absoluteString, "http://test.com")
    }
    
}


