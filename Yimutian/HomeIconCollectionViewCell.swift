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
        
        iconLabel = UILabel(frame: CGRect(x: 0,y: 0,width: frame.size.width,height: frame.size.height))
        iconLabel.textAlignment = .left
        iconLabel.textColor = UIColor.white()
        iconLabel.font = UIFont.systemFont(ofSize: 14)
        
        contentView.addSubview(iconLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
