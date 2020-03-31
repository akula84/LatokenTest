//
//  ViewController.swift
//  Modulbank
//
//  Created by Артем Кулагин on 25.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    typealias API = GetCurrency
    var items: [API.APIItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    func loadItems() {
        Router.showLoader()
        API(sync: false, object: nil) { [weak self] (items, _, _) in
            Router.removeLoader()
            self?.items = items as? [API.APIItem]
            self?.reloadTable()
        }
    }
}
