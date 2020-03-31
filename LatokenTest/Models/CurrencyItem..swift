//
//  CurrencyItem..swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import RealmSwift

class CurrencyItem: Object, Decodable {
    @objc dynamic var id: String?
    @objc dynamic var status: String?
    @objc dynamic var type: String?
    @objc dynamic var name: String?
    @objc dynamic var tag: String?
    @objc dynamic var logo: String?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
