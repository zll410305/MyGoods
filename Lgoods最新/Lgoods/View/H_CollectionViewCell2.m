//
//  H_CollectionViewCell2.m
//  Lgoods
//
//  Created by Administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "H_CollectionViewCell2.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface H_CollectionViewCell2 ()

@property (strong, nonatomic)UIView *backView;// 背景卡片

@property (strong, nonatomic)UILabel *label1;// 已售出

@property (strong, nonatomic)UILabel *label2;// 件

@end

@implementation H_CollectionViewCell2

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backView = [[UIView alloc]init];
        //        self.backView.layer.cornerRadius = 3;
        //        self.backView.layer.masksToBounds = YES;
        self.backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_backView];
        
        self.picture = [[UIImageView alloc]init];
        [self.backView addSubview:_picture];
        
        self.titleLab = [[UILabel alloc]init];
        self.titleLab.font = [UIFont systemFontOfSize:12];
        self.titleLab.numberOfLines = 2;
        [self.backView addSubview:_titleLab];
        
        self.priceLab = [[UILabel alloc]init];
        self.priceLab.font = [UIFont systemFontOfSize:15];
        self.priceLab.textColor = [UIColor redColor];
        [self.backView addSubview:_priceLab];
        
        self.numberLab = [[UILabel alloc]init];
        self.numberLab.font = [UIFont systemFontOfSize:12];
        self.numberLab.textColor = [UIColor redColor];
        self.numberLab.textAlignment = NSTextAlignmentCenter;
        [self.backView addSubview:self.numberLab];
        
        self.label1 = [[UILabel alloc]init];
        self.label1.font = [UIFont systemFontOfSize:12];
        self.label1.textColor = [UIColor grayColor];
        self.label1.text = @"已售出";
        [self.backView addSubview:_label1];
        
        self.label2 = [[UILabel alloc]init];
        self.label2.font = [UIFont systemFontOfSize:12];
        self.label2.textColor = [UIColor grayColor];
        self.label2.text = @"件";
        [self.backView addSubview:_label2];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.backView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 140);
    self.picture.frame = CGRectMake(5, 5, 145, 130);
    self.titleLab.frame = CGRectMake(160, 5, 150, 45);
    self.priceLab.frame = CGRectMake(160, 55, 50, 40);
    self.label1.frame = CGRectMake(160, 100, 40, 20);
    self.numberLab.frame = CGRectMake(200, 100, 30, 20);
    self.label2.frame = CGRectMake(230, 100, 15, 20);
}

@end
