//
//  ViewController.TableView.swift
//  Modulbank
//
//  Created by Артем Кулагин on 25.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CurrencyCell = tableView.dequeue(for: indexPath)
        cell.item = item(indexPath)
        return cell
    }
}

extension ViewController {
    func reloadTable() {
        tableView.reloadData()
    }

    func item(_ indexPath: IndexPath) -> API.APIItem? {
        items?.valueAt(indexPath.row)
    }
}
