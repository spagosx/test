//
//  AppDelegateTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class AppDelegateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_didFinishLaunching_wireframe_calls() {
        let application = UIApplication.shared.delegate as! AppDelegate
        let mockWireframe = MockWireframe()
        application.wireframe = mockWireframe
        application.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        XCTAssertEqual(mockWireframe.wireUpInvocations.count, 1)
    }
    
}

class MockWireframe: Wireframe {
    var wireUpInvocations: [FlickrView] = []
    func wireUp(view: FlickrView) {
        wireUpInvocations.append(view)
    }
}
