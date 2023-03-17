//
//  CustomButton.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 20.03.23.
//
import UIKit

@IBDesignable
class AddProfilePictureView: UIButton {

    @IBInspectable var leftHandImage: UIImage? {
        didSet {
            leftHandImage = leftHandImage?.withRenderingMode(.alwaysOriginal)
            setupImages()
        }
    }
    @IBInspectable var rightHandImage: UIImage? {
        didSet {
            rightHandImage = rightHandImage?.withRenderingMode(.alwaysTemplate)
            setupImages()
        }
    }

    func setupImages() {
        if let leftImage = leftHandImage {
            self.setImage(leftImage, for: .normal)
            self.imageView?.contentMode = .scaleAspectFill
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: self.frame.width - (self.imageView?.frame.width)!)
        }

        if let rightImage = rightHandImage {
            let rightImageView = UIImageView(image: rightImage)
            rightImageView.tintColor = .black

            let height = self.frame.height / 2
            let width = height
            let xPos = self.frame.width - width
            let yPos = (self.frame.height - height) / 2

            rightImageView.frame = CGRect(x: xPos, y: yPos, width: width, height: height)
            self.addSubview(rightImageView)
        }
    }
}
