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
    @IBOutlet var textField: UITextField!

    var items: [GetCurrency.APIItem]? {
        didSet {
            currencyView.items = items
        }
    }

    var originalItems: [GetCurrency.APIItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        prepareHandlers()
        prepareInfo()
    }

    func prepareInfo() {
        InfoManager.load(complete: { [weak self] in
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
        GetCurrency { [weak self] items, _, _ in
            Router.removeLoader()
            self?.items = items as? [GetCurrency.APIItem]
            self?.originalItems = self?.items
        }
    }

    func showDetail(item: GetCurrency.APIItem?) {
        let vc = DetailViewController.controller()
        vc.item = item
        Router.pushViewController(vc)
    }
 
}

extension ViewController: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         textField.resignFirstResponder()
         return true
     }
}
