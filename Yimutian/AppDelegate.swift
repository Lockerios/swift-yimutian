//
//  AppDelegate.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func p_nav_init(_ vc: UIViewController, index: NSInteger) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        switch index {
        case 0:
            vc.title = "首页";
            vc.navigationItem.title = "一亩田"
        case 1:
            vc.title = "商机";
            vc.navigationItem.title = "商机"
        case 2:
            vc.title = "消息";
            vc.navigationItem.title = "消息"
        case 3:
            vc.title = "发布";
            vc.navigationItem.title = "发布"
        case 4:
            vc.title = "个人";
            vc.navigationItem.title = "个人"
        default:
            vc.title = "一亩田";
            vc.navigationItem.title = "一亩田"
        }
        
        return nav
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: SCREEN_BOUNDS)
        window?.makeKeyAndVisible()

        let homeVC = HomeViewController()
        let findVC = FindViewController()
        let msgVC = MsgViewController()
        let publishVC = PublishViewController()
        let mineVC = MineViewController()
        
        let tabVC = UITabBarController()
        tabVC.viewControllers = [p_nav_init(homeVC,index: 0),p_nav_init(findVC,index: 1),p_nav_init(msgVC,index: 2),p_nav_init(publishVC,index: 3),p_nav_init(mineVC,index: 4)]
        
        
        window?.rootViewController = tabVC
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

