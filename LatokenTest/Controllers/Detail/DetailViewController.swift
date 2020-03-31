//
//  DetailViewController.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var item: GetCurrency.APIItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = item?.name
        loadItem()
    }
    
    func loadItem() {
        Router.showLoader()
        GetExchange(sync: false, object: item?.tag) { [weak self] (reply, _, _) in
            Router.removeLoader()
            guard let value = (reply as? GetExchange.APIItem)?.value else {
                return
            }
            self?.label.text = "\(value)"
        }
    }
}
