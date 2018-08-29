//
//  ViewControllerTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class ViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_viewReady_onPresenter() {
        let viewController = ViewController()
        let mockPresenter = MockPresenter()
        viewController.presenter = mockPresenter
        viewController.viewDidLoad()
        
        XCTAssertEqual(mockPresenter.viewReadyInvocations, 1)
    }
    
}

class MockPresenter: FlickrListPresenter {
    
    var interactor: FlickrListInteractor?
    
    var viewReadyInvocations: Int = 0
    func viewReady() {
        viewReadyInvocations += 1
    }
}
