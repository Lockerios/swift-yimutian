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
    
    func p_addPageView(pageCount: NSInteger) -> UIView {
        let pageView = UIView()
        pageView.frame = CGRectMake(scrollView.frame.size.width*CGFloat(pageCount), 0, scrollView.frame.size.width, scrollView.frame.size.height)
        pageView.backgroundColor = pageCount%2==0 ? UIColor.redColor() : UIColor.blueColor()
        
        return pageView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        scrollView = UIScrollView(frame: CGRectMake(0,0,frame.size.width,frame.size.height))
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.pagingEnabled = true
        
        for num in 0...2 {
            scrollView.addSubview(p_addPageView(num))
        }
        
        scrollView.contentSize = CGSizeMake(frame.size.width*3, frame.size.height)
        
        pageControl = UIPageControl(frame: CGRectMake(0,frame.size.height-44,frame.size.width,44))
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        
        self.addSubview(scrollView)
        self.addSubview(pageControl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
