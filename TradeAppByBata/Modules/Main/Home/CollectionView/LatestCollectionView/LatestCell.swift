//
//  LatestCell.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 25.03.23.
//

import UIKit

class LatestCell: UICollectionViewCell {
    
    @IBOutlet var latestImageView: UIImageView!
    @IBOutlet var latestCategoryName: UILabel!
    @IBOutlet var latestItemName: UILabel!
    @IBOutlet var priceItem: UILabel!
    @IBOutlet var plusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        latestImageView.layer.cornerRadius = 10
    }
    
 
    @IBAction func plusButtonPressed(_ sender: Any) {
    }
}
