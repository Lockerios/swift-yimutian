//
//  PublishViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class PublishViewController: BaseViewController {

    var buyBtn, sellBtn, infoBtn: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "发布消息"
        
        sellBtn = UIButton(type: .custom)
        sellBtn.frame = CGRect(x: 20, y: 80, width: SCREEN_WIDTH/2-60, height: SCREEN_WIDTH/2-60)
        sellBtn.setTitle("我要卖", for: UIControlState())
        sellBtn.setTitleColor(UIColor.black(), for: UIControlState())
        sellBtn.addTarget(self, action: #selector(PublishViewController.p_sell), for: .touchUpInside)
        sellBtn.layer.borderColor = UIColor.gray().cgColor
        sellBtn.layer.borderWidth = 1.0
        
        buyBtn = UIButton(type: .custom)
        buyBtn.frame = CGRect(x: SCREEN_WIDTH/2+40, y: 80, width: SCREEN_WIDTH/2-60, height: SCREEN_WIDTH/2-60)
        buyBtn.setTitle("我要买", for: UIControlState())
        buyBtn.setTitleColor(UIColor.black(), for: UIControlState())
        buyBtn.addTarget(self, action: #selector(PublishViewController.p_buy), for: .touchUpInside)
        buyBtn.layer.borderColor = UIColor.gray().cgColor
        buyBtn.layer.borderWidth = 1.0
        
        infoBtn = UIButton(type: .custom)
        infoBtn.frame = CGRect(x: 20, y: SCREEN_WIDTH/2+80, width: SCREEN_WIDTH-40, height: SCREEN_WIDTH-40)
        infoBtn.setTitle("发布商机", for: UIControlState())
        infoBtn.setTitleColor(UIColor.black(), for: UIControlState())
        infoBtn.addTarget(self, action: #selector(PublishViewController.p_publishInfo), for: .touchUpInside)
        infoBtn.layer.borderColor = UIColor.gray().cgColor
        infoBtn.layer.borderWidth = 1.0
        
        view.addSubview(sellBtn)
        view.addSubview(buyBtn)
        view.addSubview(infoBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    func p_sell() {
        
    }
    
    func p_buy() {
        
    }
    
    func p_publishInfo() {
        
    }
    
    //MARK: - Actions

}
