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
        presenter.view = view as! FlickrListView
        let interactor = DefaultFlickrListInteractor(networkManager: FlickrNetwork(session: URLSession.shared), feedParser: FlickrFeedParser())
        presenter.interactor = interactor
        interactor.output = presenter
    }
}
