//
//  TableCurrencyView.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class TableCurrencyView: BaseViewWithXIBInit {
    @IBOutlet var tableView: UITableView!

    var items: [GetCurrency.APIItem]? {
        didSet {
            reloadTable()
        }
    }

    var onDidSelect: ((GetCurrency.APIItem?) -> Void)?

    func reloadTable() {
        tableView.reloadData()
    }

    func item(_ indexPath: IndexPath) -> GetCurrency.APIItem? {
        items?.valueAt(indexPath.row)
    }
}
