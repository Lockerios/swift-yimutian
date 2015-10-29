//
//  HomeViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var searchBtn: UIBarButtonItem!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn = UIBarButtonItem(title: "搜索", style: .Plain, target: self, action: "p_searchBtnCalled")
        self.navigationItem.rightBarButtonItem = searchBtn
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - Methods
    
    override func p_initUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func p_searchBtnCalled() {
        let searchVC = SearchViewController()
        searchVC.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(searchVC, animated: true)
    }

    //MARK: - Actions
    
    
}

