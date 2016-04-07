//
//  ShopCollectionViewCell.m
//  Lgoods
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShopCollectionViewCell.h"

@implementation ShopCollectionViewCell



-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        
        self.backView=[[UIView alloc]init];
        self.backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_backView];

        self.img=[[UIImageView alloc]init];
        [self.backView addSubview:self.img];
        
        self.lab1=[[UILabel alloc]init];
        [self.backView addSubview:self.lab1];
        
        self.lab2=[[UILabel alloc]init];
        [self.backView addSubview:self.lab2];
    }
    
    return self;
    
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.backView.frame=CGRectMake(5, 5, ([UIScreen mainScreen].bounds.size.width)/2-5, ([UIScreen mainScreen].bounds.size.height-30)/2);
    self.img.frame=CGRectMake(5, 10, ([UIScreen mainScreen].bounds.size.width-20)/2-10, ([UIScreen mainScreen].bounds.size.height-60)/2-50);
    self.lab1.frame=CGRectMake(10, ([UIScreen mainScreen].bounds.size.height-60)/2-40, [UIScreen mainScreen].bounds.size.width-20, 20);
    
     self.lab2.frame=CGRectMake(10, ([UIScreen mainScreen].bounds.size.height-60)/2-25, [UIScreen mainScreen].bounds.size.width-20, 30);
    
    
    
    
    
    
    
}
@end
