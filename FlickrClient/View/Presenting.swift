//
//  Presenting.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation

protocol FlickrListView: FlickrView {
    func refresh()
}

protocol FlickrListPresenter {
    var interactor: FlickrListInteractor? { get set }
    func viewReady()
    
    func numberOfItems() -> Int
    func identifier(for indexPath: IndexPath) -> String
}

class DefaultFlickrListPresenter: FlickrListPresenter, InteractorOutput {
    
    weak var view: FlickrListView?
    
    var interactor: FlickrListInteractor?
    func viewReady() {
        interactor?.fetchList()
    }

    var list: FlickrResponse?
    
    func didFetchFeed(list: FlickrResponse) {
        self.list = list
        view?.refresh()
    }
    
    func numberOfItems() -> Int {
        return list?.items.count ?? 0
    }
    
    func identifier(for indexPath: IndexPath) -> String {
        return "FlickrCell"
    }
}
