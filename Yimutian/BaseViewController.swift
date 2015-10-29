//
//  BaseViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func p_initUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p_initUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    
    
    //MARK: - Actions

}
