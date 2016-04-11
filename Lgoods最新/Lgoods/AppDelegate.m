//
//  AppDelegate.m
//  Lgoods
//
//  Created by administrator on 16/3/27.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "ClassViewController.h"
#import "ShowViewController.h"
#import "ShoppingCartViewController.h"
#import "PersonViewController.h"
#import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()

#define AppKey    @"1068c2846df00"
#define AppSecret  @"3b3318a4a37dfbfab64e58f28faea893"

@property (strong,nonatomic)UINavigationController *na;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SMSSDK registerApp:AppKey withSecret:AppSecret];

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    

        HomeViewController *homeVC = [[HomeViewController alloc]init];
        
        self.na=[[UINavigationController alloc]initWithRootViewController:homeVC];
        self.na.navigationBarHidden=YES;

        
        ClassViewController *classVC = [[ClassViewController alloc]init];
        UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:classVC];
      nav2.navigationBarHidden=YES;
        
        ShowViewController *showVC = [[ShowViewController alloc]init];
        UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:showVC];
        
        ShoppingCartViewController *shopVC = [[ShoppingCartViewController alloc]init];
        UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:shopVC];
        
        PersonViewController *personVC = [[PersonViewController alloc]init];
        UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:personVC];
         nav5.navigationBarHidden=YES;
        
        //tabBar
        UITabBarController *tabBar = [[UITabBarController alloc]init];
        
        homeVC.title = @"首页";
        homeVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_home_btn@2x"];
        
        classVC.title = @"分类";
        classVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_saunter_btn@2x"];
        
        showVC.title = @"秀一秀";
        
        showVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_branc_btn@2x"];
        
        shopVC.title = @"购物车";
        shopVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_shopcart_btn@2x"];
        
        personVC.title = @"个人中心";
        personVC.tabBarItem.image = [UIImage imageNamed:@"home_tab_personal_btn@2x"];
        tabBar.viewControllers = @[_na,nav2,nav3,nav4,nav5];
        NSLog(@" 不是第一次进入");
    
       tabBar.tabBar.hidden=YES;
    
         self.window.rootViewController = tabBar;
           [self.window makeKeyAndVisible];

   
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
