//
//  GetDetail.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import Alamofire

class GetExchange: AlamofireAPI {
    typealias APIItem = ExchangeItem

    override var path: String {
        guard let tag = object else {
            return ""
        }
        return "/rate/\(tag)/USD"
    }

    override func apiDidReturnReply(_ parsed: Any?, raw: Any?) {
        let item = JSONDecoder().decodeDictionary(APIItem.self, from: parsed as? AliasDictionary)
        DispatchQueue.main.async {
            super.apiDidReturnReply(item, raw: raw)
        }
    }
}
