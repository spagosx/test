//
//  ViewController.swift
//  FlickrClient
//
//  Created by Danny Spanners on 29/08/2018.
//

import UIKit

class ViewController: UIViewController, FlickrListView {

    var presenter: FlickrListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presenter?.viewReady()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
