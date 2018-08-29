//
//  Mocks.swift
//  FlickrClientTests
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation
@testable import FlickrClient

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
    }
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
}

class MockWireframe: Wireframe {
    var wireUpInvocations: [FlickrView] = []
    func wireUp(view: FlickrView) {
        wireUpInvocations.append(view)
    }
}

class MockFlickrView: FlickrView {
    var presenter: FlickrListPresenter?
}
