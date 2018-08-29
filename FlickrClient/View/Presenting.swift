//
//  Presenting.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation

protocol FlickrListView: FlickrView {
}

protocol FlickrListPresenter {
    var interactor: FlickrListInteractor? { get set }
    func viewReady()
}

class DefaultFlickrListPresenter: FlickrListPresenter {
    var interactor: FlickrListInteractor?
    func viewReady() {
        interactor?.fetchList()
    }
}
