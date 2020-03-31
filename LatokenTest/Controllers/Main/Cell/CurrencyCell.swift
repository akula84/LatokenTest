//
//  СharacterCell.swift
//  Modulbank
//
//  Created by Артем Кулагин on 25.03.2020.
//  Copyright © 2020 Артем Кулагин. All rights reserved.
//

import Alamofire
import UIKit
import Kingfisher

class CurrencyCell: UITableViewCell {
    
    struct Const {
        static var widthImage = CGFloat(50)
    }
    
    @IBOutlet var imageCharacter: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var tagLabel: UILabel!
    @IBOutlet var widthImageConstraint: NSLayoutConstraint!
    
    var item: GetCurrency.APIItem? {
        didSet {
            nameLabel.text = item?.name
            tagLabel.text = item?.tag
            prepareImage()
        }
    }
    
    func prepareImage() {
        imageCharacter.image = nil
        imageCharacter.kf.cancelDownloadTask()
        widthImageConstraint.constant = 0
        guard let imagePath = InfoManager.image(item),
            let url = URL(string: imagePath) else {
            return
        }
        widthImageConstraint.constant = Const.widthImage
        imageCharacter.kf.setImage(with: url)
    }
}
