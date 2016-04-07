//
//  HomeViewController.h
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"

@protocol GetCityDelegate <NSObject>

- (void)getCityName:(NSString *)cityName;

@end


@interface HomeViewController : UIViewController<UIScrollViewDelegate,GetCityDelegate>

@property (strong, nonatomic)UIView *viewScro;  //滑动的view

@property (strong, nonatomic)UIScrollView *scroll;  //scrollView

@property (strong, nonatomic)NSArray *arrPics;  //滑动的数组

@property (strong, nonatomic)NSTimer *times;   //计时器

@property (assign, nonatomic)int i;  //当前滑动图片

@property (strong, nonatomic)UIPageControl *page;  //点点

@property (assign, nonatomic)int a;


@end
