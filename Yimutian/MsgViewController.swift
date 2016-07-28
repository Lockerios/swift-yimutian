//
//  MsgViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class MsgViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "cellIdentifier"
    
    var tableView: UITableView!
    var refreshControl: UIRefreshControl!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: SCREEN_BOUNDS)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(tableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = AttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(MsgViewController.p_refresh), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    func p_refresh() {
        self.perform(#selector(MsgViewController.p_loadData), with: nil, afterDelay: 1.5)
    }
    
    func p_loadData() {
        refreshControl.endRefreshing()
    }
    
    //MARK: - Actions

    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        cell?.textLabel!.text = "未读消息，点击查看"
        
        return cell!
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dLog(message: "\((indexPath as NSIndexPath).row) selected")
    }
}
