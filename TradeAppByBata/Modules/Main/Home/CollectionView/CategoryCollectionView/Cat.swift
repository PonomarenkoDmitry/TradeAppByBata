//
//  Cat.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 23.03.23.
//

import UIKit

class Cat: UICollectionViewCell {
    
    @IBOutlet private weak var label: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(name: String) {
        label.text = name
    }
}
