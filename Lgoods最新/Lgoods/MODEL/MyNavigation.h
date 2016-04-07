//
//  MyNavigation.h
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigation : UIView
@property (strong,nonatomic)UIImageView *bgimg;
@property (strong,nonatomic)UILabel *titlelab;
@property (strong,nonatomic)UIImageView *titleimg;
@property (strong,nonatomic)UIButton *leftbut;
@property (strong,nonatomic)UIButton *rightbut;


-(instancetype)initWithBgimg:(NSString *)bgimg andWithTitlelab:(NSString *)titlelab andWithtitleimg:(NSString *)titleimg andWithLeftbut:(NSString *)leftbut andWithRight:(NSString *)rightbut;



@end