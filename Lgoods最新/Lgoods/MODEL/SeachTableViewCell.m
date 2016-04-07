//
//  SeachTableViewCell.m
//  Lgoods
//
//  Created by administrator on 16/3/31.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "SeachTableViewCell.h"

@implementation SeachTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.lab=[[UILabel alloc]init];
        [self.contentView addSubview:self.lab];
        
        self.lab2=[[UILabel alloc]init];
        [self.contentView addSubview:self.lab2];
    }
    
    return self;
}



-(void)layoutSubviews{
    
    self.lab.frame=CGRectMake(10, 10,  [UIScreen mainScreen].bounds.size.width-20, 30);
    self.lab2.frame=CGRectMake(10, 49,  [UIScreen mainScreen].bounds.size.width-20, 1);
    
    
    
    
}
@end
