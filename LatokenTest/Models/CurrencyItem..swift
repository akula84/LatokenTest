//
//  CurrencyItem..swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import Foundation

class CurrencyItem: Decodable {
    var id: String?
    var status: String?
    var type: String?
    var name: String?
    var tag: String?
    var description: String?
    var logo: String?
}
