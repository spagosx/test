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
        let interactor = DefaultFlickrListInteractor(networkManager: FlickrNetwork())
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
        network.fetchFrom(urlString: "")
    }
}

protocol NetworkManager {
    func fetchFrom(urlString: String)
}

class FlickrNetwork: NetworkManager {
    func fetchFrom(urlString: String) {
        
    }
}
