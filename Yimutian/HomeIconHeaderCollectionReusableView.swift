//
//  HomeIconHeaderCollectionReusableView.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class HomeIconHeaderCollectionReusableView: UICollectionReusableView {
    var scrollView: UIScrollView!
    var pageControl: UIPageControl!
    
    func p_addPageView(_ pageCount: NSInteger) -> UIView {
        let pageView = UIView()
        pageView.frame = CGRect(x: scrollView.frame.size.width*CGFloat(pageCount), y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        pageView.backgroundColor = pageCount%2==0 ? UIColor.red() : UIColor.blue()
        
        return pageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView = UIScrollView(frame: CGRect(x: 0,y: 0,width: frame.size.width,height: frame.size.height))
        scrollView.backgroundColor = UIColor.white()
        scrollView.isPagingEnabled = true
        
        for num in 0...2 {
            scrollView.addSubview(p_addPageView(num))
        }
        
        scrollView.contentSize = CGSize(width: frame.size.width*3, height: frame.size.height)
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: frame.size.height-44,width: frame.size.width,height: 44))
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        
        self.addSubview(scrollView)
        self.addSubview(pageControl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
