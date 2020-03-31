//
//  RNSDataManager.swift
//  RNIS
//
//  Created by Артем Кулагин on 07.08.17.
//  Copyright © 2017 Артем Кулагин. All rights reserved.
//

import RealmSwift
import UIKit
/**
 Контроллер БД
 */
class DataManager: NSObject {
    static var realm: Realm? {
        do {
            return try Realm()
        } catch {
            return nil
        }
    }

    static var historyItems: [CurrencyItem]? {
        guard let items = realm?.objects(CurrencyItem.self) else {
            return nil
        }
        return Array(items)
    }

    static func save(item: CurrencyItem?) {
        guard let item = item else {
            return
        }
        write({
            realm?.add(item, update: .all)
        })
    }

    static func write(_ block: EmptyBlock?, complete: EmptyBlock? = nil) {
        do {
            try realm?.write {
                block?()
            }
            complete?()
        } catch {}
    }
}
