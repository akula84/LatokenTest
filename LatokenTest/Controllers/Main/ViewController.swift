//
//  ViewController.swift
//  Modulbank
//
//  Created by Артем Кулагин on 25.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currencyView: TableCurrencyView!

    var items: [GetCurrency.APIItem]? {
        didSet {
            currencyView.items = items
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        prepareHandlers()
        prepareInfo()
    }
    
    func prepareInfo() {
        InfoManager.load(complete:{ [weak self] in
            self?.currencyView.reloadTable()
        })
    }

    func prepareHandlers() {
        currencyView.onDidSelect = { [weak self] in
            DataManager.save(item: $0)
            self?.showDetail(item: $0)
        }
    }

    func loadItems() {
        Router.showLoader()
        GetCurrency() { [weak self] items, _, _ in
            Router.removeLoader()
            self?.items = items as? [GetCurrency.APIItem]
        }
    }

    func showDetail(item: GetCurrency.APIItem?) {
        let vc = DetailViewController.controller()
        vc.item = item
        Router.pushViewController(vc)
    }

    @IBAction func actionHistory(_ sender: Any) {
        let vc = HistoryViewController.controller()
        vc.onDidSelect = { [weak self] in
            self?.showDetail(item: $0)
        }
        let nav = UINavigationController(rootViewController: vc)
        Router.present(nav)
    }
}
