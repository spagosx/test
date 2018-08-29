//
//  Mocks.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation
@testable import FlickrClient
import UIKit

class MockSession: NetworkSession {
    
    var startInvocations: [URLRequest] = []
    func start(with request: URLRequest, finished: @escaping (Data?, Error?) -> ()) {
        startInvocations.append(request)
    }
}

class MockNetwork: NetworkManager {
    
    var fetchFromInvocations: [String] = []
    func fetchFrom(urlString: String, completion: @escaping ((Data?, Error?) -> ())) {
        fetchFromInvocations.append(urlString)
        completion(dataToReturn, nil)
    }
    
    var dataToReturn = "test data".data(using: .utf8)
}

class MockInteractor: FlickrListInteractor {
    var fetchListInvocations: Int = 0
    func fetchList() {
        fetchListInvocations += 1
    }
}

class MockPresenter: FlickrListPresenter {
    
    var interactor: FlickrListInteractor?
    
    var viewReadyInvocations: Int = 0
    func viewReady() {
        viewReadyInvocations += 1
    }
    
    func numberOfItems() -> Int {
        return 2
    }
    
    var setupCellInvocations: [(ConfigurablePhotoCell, IndexPath)] = []
    func setup(cell: ConfigurablePhotoCell, at indexPath: IndexPath) {
        setupCellInvocations.append((cell, indexPath))
    }
    
    func identifier(for indexPath: IndexPath) -> String {
        return "test identifier"
    }

}

class MockWireframe: Wireframe {
    var wireUpInvocations: [FlickrView] = []
    func wireUp(view: FlickrView) {
        wireUpInvocations.append(view)
    }
}

class MockFlickrView: FlickrListView {
    var refreshInvocations: Int = 0
    func refresh() {
        refreshInvocations += 1
    }
    
    var presenter: FlickrListPresenter?
}

class MockParser: Parsing {
    var parseInvocations: [Data] = []
    var responseToReturn: FlickrResponse? = FlickrResponse(title: "test title", items: [])
    func parse<T>(data: Data) -> T? where T : Decodable {
        parseInvocations.append(data)
        return  responseToReturn as? T
    }
}

class MockInteractorOutput: InteractorOutput {
    var didFetchFeedInvocations: [FlickrResponse] = []
    func didFetchFeed(list: FlickrResponse) {
        didFetchFeedInvocations.append(list)
    }
}

class MockTableView: UITableView {
    var dequeueReusableCellInvocations: [String] = []
    var cellToReturn: FlickrCell = FlickrCell()
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        dequeueReusableCellInvocations.append(identifier)
        return cellToReturn
    }
}
