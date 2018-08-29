//
//  Parsing.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import Foundation

protocol Parsing {
    func parse<T>(data: Data) -> T? where T: Decodable
}

class FlickrFeedParser: Parsing {
    func parse<T>(data: Data) -> T? where T: Decodable {
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
