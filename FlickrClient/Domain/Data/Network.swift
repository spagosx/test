//
//  Network.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation

protocol NetworkManager {
    func fetchFrom(urlString: String, completion: @escaping ((Data?, Error?) -> ()))
}

protocol NetworkSession {
    func start(with request: URLRequest, finished: @escaping (Data?, Error?)->())
}

extension URLSession: NetworkSession {
    func start(with request: URLRequest, finished: @escaping (Data?, Error?)->()) {
        dataTask(with: request) { (data, response, error) in
            finished(data, error)
            }.resume()
    }
}

class FlickrNetwork: NetworkManager {
    
    let session: NetworkSession
    init(session: NetworkSession) {
        self.session = session
    }
    
    func fetchFrom(urlString: String, completion: @escaping ((Data?, Error?) -> ())) {
        if let URL = URL(string: urlString) {
            session.start(with: URLRequest(url: URL), finished: completion)
        }
    }
}
