//
//  InfoManager.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import Foundation

class InfoManager {
    static var items: [GetInfo.APIItem]?

    static func load(complete: EmptyBlock?) {
        GetInfo { items, _, _ in
            self.items = items as? [GetInfo.APIItem]
            complete?()
        }
    }

    static func image(_ item: CurrencyItem?) -> String? {
        items?.first(where: { $0.id == item?.id })?.logo
    }
}
