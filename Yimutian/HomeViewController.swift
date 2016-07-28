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
    var refreshControl: UIRefreshControl!
    var headerView: HomeIconHeaderCollectionReusableView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBtn = UIBarButtonItem(title: "搜索", style: .plain, target: self, action: #selector(HomeViewController.p_searchBtnCalled))
        self.navigationItem.rightBarButtonItem = searchBtn
        
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: SCREEN_BOUNDS, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white()
        collectionView.register(HomeIconCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(HomeIconHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(HomeIconFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerIdentifier)
        
        self.view.addSubview(collectionView)
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = AttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(HomeViewController.p_refresh), for: UIControlEvents.valueChanged)
        collectionView.addSubview(refreshControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: - Methods
    
    override func p_initUI() {
        self.view.backgroundColor = UIColor.white()
    }
    
    func p_searchBtnCalled() {
        let searchVC = SearchViewController()
        searchVC.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func p_refresh() {
        self.perform(#selector(HomeViewController.p_loadData), with: nil, afterDelay: 1.5)
    }
    
    func p_loadData() {
        refreshControl.endRefreshing()
    }

    //MARK: - Actions
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! HomeIconCollectionViewCell
        
        switch (indexPath as NSIndexPath).section {
        case 0:
            cell.backgroundColor = UIColor.blue()
        case 1:
            cell.backgroundColor = UIColor.gray()
        case 2:
            cell.backgroundColor = UIColor.purple()
        case 3:
            cell.backgroundColor = UIColor.green()
        default:
            cell.backgroundColor = UIColor.black()
        }
        
        cell.iconLabel.text = "\((indexPath as NSIndexPath).section)"+"-"+"\((indexPath as NSIndexPath).row)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            if (headerView != nil) {
                return headerView
            }
            
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! HomeIconHeaderCollectionReusableView
            headerView.scrollView.delegate = self
            
            return headerView
        case UICollectionElementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath)
            return footer
        default:
            return UICollectionReusableView()
        }
    }
    
    //MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dLog(message: "\((indexPath as NSIndexPath).row) tapped")
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch (indexPath as NSIndexPath).section {
        case 0:
            return CGSize(width: collectionView.bounds.size.width/3-20, height: 44)
        case 1:
            return CGSize(width: collectionView.bounds.size.width/2-20, height: 44)
        case 2:
            return CGSize(width: collectionView.bounds.size.width, height: 44)
        case 3:
            return CGSize(width: collectionView.bounds.size.width/2-20, height: 100)
        default:
            return CGSize(width: collectionView.bounds.size.width, height: 44)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var headerHeight: CGFloat = 0
        if section==0 {
            headerHeight = 150
        }
        
        return CGSize(width: collectionView.bounds.size.width, height: headerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        var footerHeight: CGFloat = 0
        if section==3 {
            footerHeight = 150
        }
        
        return CGSize(width: collectionView.bounds.width, height: footerHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(10, 0, 10, 0)
    }
    
    //MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if headerView != nil {
            headerView.pageControl.currentPage = Int(headerView.scrollView.contentOffset.x/headerView.scrollView.frame.size.width)
        }
    }
}

