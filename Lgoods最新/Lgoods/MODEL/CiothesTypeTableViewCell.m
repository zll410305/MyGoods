//
//  CiothesTypeTableViewCell.m
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "CiothesTypeTableViewCell.h"

@implementation CiothesTypeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgvie=[[UIImageView alloc]init];
        [self.contentView addSubview:self.imgvie];
        
        self.lab1=[[UILabel alloc]init];
        self.lab1.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.lab1];
        
        
        
        self.lab2=[[UILabel alloc]init];
        self.lab2.font=[UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.lab2];
        
        
        
        self.lab3=[[UILabel alloc]init];
        self.lab3.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.lab3];
        
        
        
        self.lab4=[[UILabel alloc]init];
        self.lab4.font=[UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.lab4];
        
        self.lab5=[[UILabel alloc]init];
        [self.contentView addSubview:self.lab5];
        
    }
    
    return self;
    
    
    
}




-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imgvie.frame=CGRectMake(10, 10, 110, 130);
    
    self.lab1.frame=CGRectMake(137, 15, 170, 40);
    
    self.lab2.frame=CGRectMake(137, 65, 120, 30);
    
    self.lab3.frame=CGRectMake(137, 105, 170, 20);
    
    self.lab4.frame=CGRectMake(137, 130, 170, 15);
    
    self.lab5.frame=CGRectMake(0, 149, [UIScreen mainScreen].bounds.size.width, 1);
    
}




@end
