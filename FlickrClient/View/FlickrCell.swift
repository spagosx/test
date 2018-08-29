//
//  FlickrCell.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import UIKit

protocol ConfigurablePhotoCell: class {
    var photoImageView: UIImageView! { get set }
    var titleLabel: UILabel! { get set }
    var dateLabel: UILabel! { get set }
    var publishedLabel: UILabel! { get set }
    var authorLabel: UILabel! { get set }
    var authorIdLabel: UILabel! { get set }
    var tagsLabel: UILabel! { get set }
}

class FlickrCell: UITableViewCell, ConfigurablePhotoCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var authorIdLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
}

