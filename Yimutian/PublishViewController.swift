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
        
        sellBtn = UIButton(type: .Custom)
        sellBtn.frame = CGRectMake(20, 80, SCREEN_WIDTH/2-60, SCREEN_WIDTH/2-60)
        sellBtn.setTitle("我要卖", forState: .Normal)
        sellBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        sellBtn.addTarget(self, action: Selector("p_sell"), forControlEvents: .TouchUpInside)
        sellBtn.layer.borderColor = UIColor.grayColor().CGColor
        sellBtn.layer.borderWidth = 1.0
        
        buyBtn = UIButton(type: .Custom)
        buyBtn.frame = CGRectMake(SCREEN_WIDTH/2+40, 80, SCREEN_WIDTH/2-60, SCREEN_WIDTH/2-60)
        buyBtn.setTitle("我要买", forState: .Normal)
        buyBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        buyBtn.addTarget(self, action: Selector("p_buy"), forControlEvents: .TouchUpInside)
        buyBtn.layer.borderColor = UIColor.grayColor().CGColor
        buyBtn.layer.borderWidth = 1.0
        
        infoBtn = UIButton(type: .Custom)
        infoBtn.frame = CGRectMake(20, SCREEN_WIDTH/2+80, SCREEN_WIDTH-40, SCREEN_WIDTH-40)
        infoBtn.setTitle("发布商机", forState: .Normal)
        infoBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        infoBtn.addTarget(self, action: Selector("p_publishInfo"), forControlEvents: .TouchUpInside)
        infoBtn.layer.borderColor = UIColor.grayColor().CGColor
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
