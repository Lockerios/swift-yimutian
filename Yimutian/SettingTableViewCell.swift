//
//  SettingTableViewCell.swift
//  Yimutian
//
//  Created by yangyang on 15/11/2.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

let cellHeight: CGFloat = 80

class SettingTableViewCell: UITableViewCell {
    
    var iconImageView: UIImageView!
    var iconLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView(frame: CGRectMake(0, 0, cellHeight, cellHeight))
        
        iconLabel = UILabel(frame: CGRectMake(cellHeight+20,0,200,cellHeight))
        iconLabel.font = UIFont.systemFontOfSize(18.0)
        iconLabel.textAlignment = .Left
        iconLabel.textColor = UIColor.blackColor()
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(iconLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
