//
//  Notification+KeyBoard.swift
//  Spytricks
//
//  Created by Артем Кулагин on 16.03.17.
//  Copyright © 2017 Ivan Alekseev. All rights reserved.
//

import Foundation
import UIKit

/**
 Расширение для Notification для клавиатуры
 */
extension Notification {
    
    /// Переменная высота клавиатуры
    var height: CGFloat? {
        let rect = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
        return rect?.height
    }
    
    var duration: Double? {
        return (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as AnyObject).doubleValue
    }
}
