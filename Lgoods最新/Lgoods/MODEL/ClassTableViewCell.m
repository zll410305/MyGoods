//
//  ClassTableViewCell.m
//  Lgoods
//
//  Created by administrator on 16/4/1.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ClassTableViewCell.h"

@implementation ClassTableViewCell

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
    [super layoutSubviews];
    self.lab.frame=CGRectMake(5, 20, [UIScreen mainScreen].bounds.size.width-10, 30);
    self.lab2.frame=CGRectMake(5, 69, [UIScreen mainScreen].bounds.size.width-10, 1);

    
    
    
    
    
}
@end
