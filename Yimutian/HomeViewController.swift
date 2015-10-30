//
//  HomeViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    let cellIdentifier = "cellIdentifier"
    let headerIdentifier = "headerIdentifier"
    let footerIdentifier = "footerIdentifier"
    
    var searchBtn: UIBarButtonItem!
    var collectionView: UICollectionView!
    var headerView: HomeIconHeaderCollectionReusableView!
    
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
        switch section {
        case 0:
            return 9
        case 1:
            return 6
        case 2:
            return 5
        case 3:
            return 4
        default:
            return 0
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 4
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
        case 3:
            cell.backgroundColor = UIColor.greenColor()
        default:
            cell.backgroundColor = UIColor.blackColor()
        }
        
        cell.iconLabel.text = "\(indexPath.section)"+"-"+"\(indexPath.row)"
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            if (headerView != nil) {
                return headerView
            }
            
            headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerIdentifier, forIndexPath: indexPath) as! HomeIconHeaderCollectionReusableView
            headerView.scrollView.delegate = self
            
            return headerView
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
        switch indexPath.section {
        case 0:
            return CGSizeMake(collectionView.bounds.size.width/3-20, 44)
        case 1:
            return CGSizeMake(collectionView.bounds.size.width/2-20, 44)
        case 2:
            return CGSizeMake(collectionView.bounds.size.width, 44)
        case 3:
            return CGSizeMake(collectionView.bounds.size.width/2-20, 100)
        default:
            return CGSizeMake(collectionView.bounds.size.width, 44)
        }
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
        if section==3 {
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
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if headerView != nil {
            headerView.pageControl.currentPage = Int(headerView.scrollView.contentOffset.x/headerView.scrollView.frame.size.width)
        }
    }
}

