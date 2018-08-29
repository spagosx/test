//
//  FlickrPhoto.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation

struct FlickrResponse: Codable {
    let title: String
    let items: [FlickrPhoto]
}

struct FlickrPhoto: Codable {
    let title: String
    let date: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
    let media: FlickrPhotoMedia
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case published = "published"
        case author = "author"
        case tags = "tags"
        case date = "date_taken"
        case authorId = "author_id"
        case media = "media"
    }
}

struct FlickrPhotoMedia: Codable {
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "m"
    }
}
