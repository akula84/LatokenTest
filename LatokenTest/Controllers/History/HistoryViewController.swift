//
//  HistoryViewController.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    //@IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let items = DataManager.historyItems
        print("items", items?.count)
        items?.forEach({
            print("forEach", $0)
        })
        // Do any additional setup after loading the view.
    }


}
