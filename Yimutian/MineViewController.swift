//
//  MineViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    let cellIdentifier = "cellidentifier"
    
    var tableView: UITableView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: SCREEN_BOUNDS)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(SettingTableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        
        view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    
    
    //MARK: - Actions

    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! SettingTableViewCell

        cell.iconLabel.text = "设置选项"
        cell.iconImageView.image = UIImage(named: "1.jpg")
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dLog("\(indexPath.row) selected")
    }
}
