//
//  CollectionViewCell.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 23.03.23.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {

    @IBOutlet var categoryLabel: UILabel!
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    @IBOutlet var addButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        nameLabel.layer.cornerRadius = layer.bounds.width / 2
        
//        addButton.layer.cornerRadius = layer.bounds.width / 2
        imageView.image = UIImage(named: "phone.png")

    }

    func convigurate(image: UIImage) {
        imageView.image = UIImage(named: "phone.png")
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
    }
}
