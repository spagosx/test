//
//  ViewControllerTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    var mockPresenter = MockPresenter()
    var mockTableView = MockTableView()
    
    override func setUp() {
        super.setUp()
        
        viewController = ViewController()
        viewController.presenter = mockPresenter
        viewController.tableView = mockTableView
        viewController.viewDidLoad()
    }
    
    override func tearDown() {
        viewController = nil
        
        super.tearDown()
        
    }
    
    func test_viewReady_onPresenter() {
        XCTAssertEqual(mockPresenter.viewReadyInvocations, 1)
    }
    
    func test_calls_setup_on_presenter_forCell_atIndexPath() {
        _ = viewController.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        _ = viewController.tableView(mockTableView, cellForRowAt: IndexPath(row: 1, section: 0))
        
        XCTAssertEqual(mockPresenter.setupCellInvocations.count, 2)
        XCTAssertEqual(mockPresenter.setupCellInvocations.first!.0 as! FlickrCell, mockTableView.cellToReturn)
        XCTAssertEqual(mockPresenter.setupCellInvocations.first!.1.row, 0)
        
        XCTAssertEqual(mockPresenter.setupCellInvocations.last!.0 as! FlickrCell, mockTableView.cellToReturn)
        XCTAssertEqual(mockPresenter.setupCellInvocations.last!.1.row, 1)
    }
    
    func test_numberOfRows_fromPresenter() {
        let rows = viewController.tableView(mockTableView, numberOfRowsInSection: 0)
        XCTAssertEqual(rows, 2)
    }
    
    func test_reuseIdentifier() {
        _ = viewController.tableView(mockTableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(mockTableView.dequeueReusableCellInvocations.first!, mockPresenter.identifier(for: IndexPath(row: 0, section: 0)))
    }
}

