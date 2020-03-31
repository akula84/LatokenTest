//
//  ViewController.Action.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import Foundation

extension ViewController {
    @IBAction func actionHistory(_ sender: Any) {
        let vc = HistoryViewController.controller()
        vc.onDidSelect = { [weak self] in
            self?.showDetail(item: $0)
        }
        Router.pushViewController(vc)
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        guard let text = textField.text, !text.isEmpty else {
            self.items = originalItems
            return
        }
        items = originalItems?.filter({
            let containsName = $0.name?.contains(text) ?? false
            let containsTag = $0.tag?.contains(text) ?? false
            return containsName || containsTag
        })
    }
}
