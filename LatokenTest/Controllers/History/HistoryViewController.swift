//
//  HistoryViewController.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet var currencyView: TableCurrencyView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        prepareHandlers()
    }

    var onDidSelect: ((GetCurrency.APIItem?) -> Void)?
    func prepareHandlers() {
        currencyView.onDidSelect = { [weak self] item in
            self?.dismiss(animated: true, completion: {
                self?.onDidSelect?(item)
            })
        }
    }

    func loadItems() {
        currencyView.items = DataManager.historyItems?.reversed()
    }
    
    @IBAction func actionCancel(_ sender: Any) {
        dismiss()
    }

}
