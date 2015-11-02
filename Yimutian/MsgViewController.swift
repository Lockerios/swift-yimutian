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
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(tableView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: "p_refresh", forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    func p_refresh() {
        self.performSelector(Selector("p_loadData"), withObject: nil, afterDelay: 1.5)
    }
    
    func p_loadData() {
        refreshControl.endRefreshing()
    }
    
    //MARK: - Actions

    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        cell?.textLabel!.text = "未读消息，点击查看"
        
        return cell!
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dLog("\(indexPath.row) selected")
    }
}
