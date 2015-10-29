//
//  HomeViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{

    let cellIdentifier = "cellIdentifier"
    let headerIdentifier = "headerIdentifier"
    let footerIdentifier = "footerIdentifier"
    
    var searchBtn: UIBarButtonItem!
    var collectionView: UICollectionView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn = UIBarButtonItem(title: "搜索", style: .Plain, target: self, action: "p_searchBtnCalled")
        self.navigationItem.rightBarButtonItem = searchBtn
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: SCREEN_BOUNDS, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerClass(HomeIconCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.registerClass(HomeIconHeaderCollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.registerClass(HomeIconFooterCollectionReusableView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
        self.view.addSubview(collectionView)
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
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! HomeIconCollectionViewCell
        
        switch indexPath.section {
        case 0:
            cell.backgroundColor = UIColor.blueColor()
        case 1:
            cell.backgroundColor = UIColor.grayColor()
        case 2:
            cell.backgroundColor = UIColor.purpleColor()
        default:
            cell.backgroundColor = UIColor.blackColor()
        }
        
        cell.iconLabel.text = "\(indexPath.section)"+"-"+"\(indexPath.row)"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath)
            return header
        case UICollectionElementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: footerIdentifier, forIndexPath: indexPath)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        dLog("\(indexPath.row) tapped")
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.size.width, 44)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var headerHeight: CGFloat = 0
        if section==0 {
            headerHeight = 150
        }
        
        return CGSizeMake(collectionView.bounds.size.width, headerHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        var footerHeight: CGFloat = 0
        if section==2 {
            footerHeight = 150
        }
        
        return CGSizeMake(collectionView.bounds.width, footerHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 0, 10, 0)
    }
}

