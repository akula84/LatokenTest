//
//  TableCurrencyView.TableView.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

extension TableCurrencyView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyCell = tableView.dequeue(for: indexPath)
        cell.item = item(indexPath)
        return cell
    }
}

extension TableCurrencyView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onDidSelect?(item(indexPath))
    }
}
