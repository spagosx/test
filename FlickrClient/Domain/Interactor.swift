//
//  Interactor.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation

protocol FlickrListInteractor {
    func fetchList()
}

protocol InteractorOutput: class {
    func didFetchFeed(list: FlickrResponse)
}

class DefaultFlickrListInteractor: FlickrListInteractor {
    
    let network: NetworkManager
    let parser: Parsing
    weak var output: InteractorOutput?
    
    init(networkManager: NetworkManager, feedParser: Parsing) {
        network = networkManager
        parser = feedParser
    }
    
    func fetchList() {
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"
        network.fetchFrom(urlString: urlString) { (data, error) in
            if let data = data, let feed: FlickrResponse = self.parser.parse(data: data) {
                self.output?.didFetchFeed(list: feed)
            } else if let error = error {
                print(error.localizedDescription)
            } else {
                print("parsing error")
            }
        }
    }
}
