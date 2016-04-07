//
//  CityListView.h
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface CityListView : UIViewController

@property (strong, nonatomic)UITableView *cityTable;

@property (strong, nonatomic)NSDictionary *cityProvince;  //省

@property (strong, nonatomic)NSArray *cityArr;  // 城市

@property (strong, nonatomic)UILabel *cityName;  //定位城市，  注意：定义到 .h 中，要传到首页

@property (assign, nonatomic)id<GetCityDelegate>delegate;

@end
