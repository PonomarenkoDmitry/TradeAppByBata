//
//  SaleCell.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 23.03.23.
//

import UIKit

class SaleCell: UICollectionViewCell {
 
    @IBOutlet var saleCategoryName: UILabel!
    @IBOutlet var saleItemName: UILabel!
    @IBOutlet var salePrice: UILabel!
    @IBOutlet var saleDiscont: UILabel!
    @IBOutlet var saleItemImage: UIImageView!
    @IBOutlet var sellerImage: UIImageView!
    @IBOutlet var addBasketButton: UIButton!
    @IBOutlet var addLikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        saleItemImage.layer.cornerRadius = 10
    }
}
