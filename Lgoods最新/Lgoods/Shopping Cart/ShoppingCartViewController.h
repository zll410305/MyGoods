//
//  ShoppingCartViewController.h
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCartViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic)UITableView *shopTable;

@end
