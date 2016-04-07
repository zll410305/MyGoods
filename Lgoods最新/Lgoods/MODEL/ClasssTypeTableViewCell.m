//
//  ClasssTypeTableViewCell.m
//  Lgoods
//
//  Created by administrator on 16/4/1.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ClasssTypeTableViewCell.h"

@implementation ClasssTypeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.typelab=[[UILabel alloc]init];
        [self.contentView addSubview:self.typelab];
        
        self.typelab2=[[UILabel alloc]init];
        [self.contentView addSubview:self.typelab2];
        
        
        self.img=[[UIImageView alloc]init];
        [self.contentView addSubview:self.img];
    }
    
    return self;
}



-(void)layoutSubviews{
    
    self.typelab.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    
     self.typelab2.frame=CGRectMake(0, 179, [UIScreen mainScreen].bounds.size.width, 1);
    
    self.img.frame=CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-40);
    
    
    
}
@end
