//
//  FlickrWireframe.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import UIKit

protocol FlickrView: class {
    var presenter: FlickrListPresenter? { get set }
}

protocol Wireframe {
    func wireUp(view: FlickrView)
}

class FlickrWireframe: Wireframe {
    
    func wireUp(view: FlickrView) {
        
        let presenter = DefaultFlickrListPresenter()
        view.presenter = presenter
        let interactor = DefaultFlickrListInteractor(networkManager: FlickrNetwork(session: URLSession.shared))
        presenter.interactor = interactor
    }
}

protocol FlickrListView: FlickrView {
}

protocol FlickrListPresenter {
    var interactor: FlickrListInteractor? { get set }
    func viewReady()
}

protocol FlickrListInteractor {
    func fetchList()
}

class DefaultFlickrListPresenter: FlickrListPresenter {
    var interactor: FlickrListInteractor?
    func viewReady() {
        interactor?.fetchList()
    }
}

class DefaultFlickrListInteractor: FlickrListInteractor {
    
    let network: NetworkManager
    init(networkManager: NetworkManager) {
        network = networkManager
    }
    
    func fetchList() {
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
        network.fetchFrom(urlString: urlString) { (data, error) in
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: [.allowFragments, .mutableLeaves])
                print(json)
            }
        }
    }
}

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
