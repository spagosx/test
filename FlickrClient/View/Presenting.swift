//
//  Presenting.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation
import Kingfisher

protocol FlickrListView: FlickrView {
    func refresh()
}

protocol FlickrListPresenter {
    var interactor: FlickrListInteractor? { get set }
    func viewReady()
    
    func numberOfItems() -> Int
    func identifier(for indexPath: IndexPath) -> String
    func setup(cell: ConfigurablePhotoCell, at indexPath: IndexPath)
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
    
    func setup(cell: ConfigurablePhotoCell, at indexPath: IndexPath) {
        guard let photo = list?.items[indexPath.row] else { return }
        if let url = URL(string: (photo.media.imageUrl.replacingOccurrences(of: "\\", with: ""))) {
            let resource = ImageResource(downloadURL: url)
            cell.photoImageView.kf.setImage(with: resource)
        }
        cell.titleLabel.text = photo.title
        cell.dateLabel.text = "Date taken: \(photo.date)"
        cell.publishedLabel.text = "Published on: \(photo.published)"
        cell.authorLabel.text = photo.author
        cell.authorIdLabel.text = photo.authorId
        cell.tagsLabel.text = photo.tags
    }
}
