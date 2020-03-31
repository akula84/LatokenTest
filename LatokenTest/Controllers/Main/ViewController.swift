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

    var items: [GetCurrency.APIItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }

    func loadItems() {
        Router.showLoader()
        GetCurrency(sync: false, object: nil) { [weak self] (items, _, _) in
            Router.removeLoader()
            self?.items = items as? [GetCurrency.APIItem]
            self?.reloadTable()
        }
    }
}
