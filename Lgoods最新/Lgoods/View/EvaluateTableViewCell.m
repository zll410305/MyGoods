//
//  EvaluateTableViewCell.m
//  Lgoods
//
//  Created by Administrator on 16/4/1.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "EvaluateTableViewCell.h"

@implementation EvaluateTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.userPic = [[UIImageView alloc]init];
        self.userPic.layer.cornerRadius = 15;
        self.userPic.layer.masksToBounds = YES;
        [self.contentView addSubview:_userPic];
        
        self.userName = [[UILabel alloc]init];
        self.userName.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_userName];
        
        self.time = [[UILabel alloc]init];
        self.time.font = [UIFont systemFontOfSize:12];
        self.time.textAlignment = NSTextAlignmentRight;
        self.time.textColor = [UIColor grayColor];
        [self.contentView addSubview:_time];
        
        self.content = [[UILabel alloc]init];
        self.content.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_content];
        [self initLayout];
    }
    return self;
}


- (void)initLayout{
    [super layoutSubviews];
    self.userPic.frame = CGRectMake(10, 10, 30, 30);
    self.userName.frame = CGRectMake(45, 10, 120, 30);
    self.time.frame = CGRectMake(170, 10, [UIScreen mainScreen].bounds.size.width - 180, 20);
    self.content.frame = CGRectMake(15, 45, [UIScreen mainScreen].bounds.size.width - 30, 60);
}

//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSString*)text{
    
    //获得当前cell高度
    CGRect frame = self.frame;
    //文本赋值
    self.content.text = text;
    //设置label的最大行数
    self.content.numberOfLines = 0;
    CGSize size = CGSizeMake(300, 1000);
    
    CGSize labelSize = [self.content.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    self.content.frame = CGRectMake(self.content.frame.origin.x, self.content.frame.origin.y, labelSize.width, labelSize.height);
    
    //计算出自适应的高度
    frame.size.height = _content.frame.origin.y + _content.frame.size.height + 10;
    self.frame = frame;
    
}

@end
