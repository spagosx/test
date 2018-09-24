//
//  FlickrListInteractorTests.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import XCTest
@testable import FlickrClient

class FlickrListInteractorTests: XCTestCase {
    
    var interactor: DefaultFlickrListInteractor!
    var mockNetwork = MockNetwork()
    var mockParser = MockParser()
    var mockOutput = MockInteractorOutput()
    
    override func setUp() {
        super.setUp()
        
        interactor = DefaultFlickrListInteractor(networkManager: mockNetwork, feedParser: mockParser)
        interactor.output = mockOutput
        
        interactor.fetchList()
    }
    
    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    func test_calls_network() {
        XCTAssertEqual(mockNetwork.fetchFromInvocations.count, 1)
    }
    
    func test_whenDataPresent_callsParser() {
        XCTAssertEqual(mockParser.parseInvocations.count, 1)
        XCTAssertEqual(mockParser.parseInvocations.first!, mockNetwork.dataToReturn)
    }
    
    func test_callsOutputs_withSuccessParsing() {
        XCTAssertEqual(mockOutput.didFetchFeedInvocations.count, 1)
        XCTAssertEqual(mockOutput.didFetchFeedInvocations.first!, mockParser.responseToReturn)
    }
}

extension FlickrResponse: Equatable {
    public static func ==(lhs: FlickrResponse, rhs: FlickrResponse) -> Bool {
        return lhs.title == rhs.title
    }
}
