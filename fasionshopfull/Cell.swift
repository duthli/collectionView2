//
//  Cell.swift
//  fasionshopfull
//
//  Created by do duy hung on 18/09/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    var nameLabel :UILabel!
    var imageView : UIImageView!
    var price : UILabel!
    var kPriceLabelHeight: CGFloat = 30
    var kCellWidth: CGFloat = 100
    var kLabelHeight: CGFloat = 30
    
    override init(frame:CGRect){
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addSubviews(checkAddAll: Bool) {
        if(imageView == nil){
            imageView = UIImageView(frame: CGRectMake(0, 0, kCellWidth, kCellWidth))
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
        }
        if(checkAddAll == true){
            if (nameLabel == nil){
                nameLabel = UILabel(frame: CGRectMake(0,kCellWidth,kCellWidth,kLabelHeight))
                nameLabel.textAlignment = .Left
                nameLabel.textColor = UIColor(white:0.9, alpha: 1)
                nameLabel.highlightedTextColor = tintColor
                nameLabel.font = UIFont.italicSystemFontOfSize(10)
                nameLabel.numberOfLines = 2
                contentView.addSubview(nameLabel)
            }
            
            if (price == nil){
                price = UILabel(frame: CGRectMake(0,kCellWidth + kLabelHeight,kCellWidth,kLabelHeight))
                price.textAlignment = .Left
                price.textColor = UIColor(red:255/255 , green: 116/255 , blue : 25/255, alpha: 1)
                price.highlightedTextColor = tintColor
                price.font = UIFont.boldSystemFontOfSize(12)
                contentView.addSubview(price)
            }
        }
    }
    
    
    override var selected : Bool{
        didSet{
            imageView.layer.borderWidth = selected ? 2:0
        }
    }
}
