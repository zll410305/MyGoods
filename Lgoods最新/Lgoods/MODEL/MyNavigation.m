//
//  MyNavigation.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "MyNavigation.h"

@implementation MyNavigation

-(instancetype)initWithBgimg:(NSString *)bgimg andWithTitlelab:(NSString *)titlelab andWithtitleimg:(NSString *)titleimg andWithLeftbut:(NSString *)leftbut andWithRight:(NSString *)rightbut{
    
    self=[super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    
    if (self) {
        self.bgimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        if (bgimg) {
            self.bgimg.image=[UIImage imageNamed:bgimg];
        }else{
            self.bgimg.backgroundColor=[UIColor orangeColor];
        }
        [self addSubview:self.bgimg];
        
        self.titleimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        if (titleimg) {
            self.titleimg.image=[UIImage imageNamed:titleimg];
            [self addSubview:self.titleimg];
            
        }else{
            self.titlelab=[[UILabel alloc]initWithFrame:CGRectMake(135, 10, [UIScreen mainScreen].bounds.size.width-250, 64)];
            self.titlelab.textColor=[UIColor whiteColor];
            self.titlelab.font=[UIFont systemFontOfSize:18];
            self.titlelab.text=titlelab;
            [self addSubview:self.titlelab];
        }
        
        
        self.leftbut=[[UIButton  alloc]initWithFrame:CGRectMake(10, 20, 40,40)];
        self.leftbut.titleLabel.font=[UIFont systemFontOfSize:12 ];
        [self.leftbut setTitle:leftbut  forState:UIControlStateNormal];
        [self addSubview:self.leftbut];
        
        
        self.rightbut=[[UIButton  alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-40, 29, 20, 20)];
        [self.rightbut setBackgroundImage:[UIImage imageNamed:rightbut] forState:UIControlStateNormal];
        [self addSubview:self.rightbut];
        
        
        
        
    }
    
    return self;
}

@end
