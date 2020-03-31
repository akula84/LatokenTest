//
//  GetCurrency.swift
//  LatokenTest
//
//  Created by Артем Кулагин on 31.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

class GetCurrency: AlamofireAPI {
    typealias APIItem = CurrencyItem

    override var path: String {
        return "/currency"
    }

    override func apiDidReturnReply(_ parsed: Any?, raw: Any?) {
        guard let response = parsed as? DataResponse<Data>,
            let data = response.data,
            let textJson = String(data: data, encoding: .utf8),
            let dicts = textJson.jsonDictionarys  else {
                DispatchQueue.main.async {
                    super.apiDidReturnReply(nil, raw: raw)
                }
            return
        }
        let items = JSONDecoder().decodeDictionarys(APIItem.self, from: dicts)
        DispatchQueue.main.async {
            super.apiDidReturnReply(items, raw: raw)
        }
    }

    override var shouldLogRequest: Bool {
        true
    }
}
