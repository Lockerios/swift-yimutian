//
//  HomeIconCollectionViewCell.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class HomeIconCollectionViewCell: UICollectionViewCell {
    var iconLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconLabel = UILabel(frame: CGRectMake(0,0,frame.size.width,frame.size.height))
        iconLabel.textAlignment = .Left
        iconLabel.textColor = UIColor.whiteColor()
        iconLabel.font = UIFont.systemFontOfSize(14)
        
        contentView.addSubview(iconLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
