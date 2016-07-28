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
        
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cellHeight, height: cellHeight))
        
        iconLabel = UILabel(frame: CGRect(x: cellHeight+20,y: 0,width: 200,height: cellHeight))
        iconLabel.font = UIFont.systemFont(ofSize: 18.0)
        iconLabel.textAlignment = .left
        iconLabel.textColor = UIColor.black()
        
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
