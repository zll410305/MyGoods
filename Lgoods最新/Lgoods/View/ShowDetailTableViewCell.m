//
//  ShowDetailTableViewCell.m
//  Lgoods
//
//  Created by Administrator on 16/4/7.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShowDetailTableViewCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation ShowDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //      style1
        if ([reuseIdentifier isEqualToString:@"showdetail"]) {
            
            UIImageView *userPic1 = [[UIImageView alloc]init];
            userPic1.layer.masksToBounds = YES;
            userPic1.layer.cornerRadius = 15;
            [self.contentView addSubview:userPic1];
            self.userPic1 = userPic1;
            
            UILabel *userName1 = [[UILabel alloc]init];
            userName1.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:userName1];
            self.userName1 = userName1;
            
            UILabel *timeLab1 = [[UILabel alloc]init];
            timeLab1.font = [UIFont systemFontOfSize:12];
            timeLab1.textAlignment = NSTextAlignmentRight;
            [self.contentView addSubview:timeLab1];
            self.timeLab1 = timeLab1;
            
            for (int i = 0; i < 5; i++) {
                UIImageView *image = [[UIImageView alloc]init];
                image.tag = 100 + i;
                [self.contentView addSubview:image];
            }
            
            UILabel *contentLab1 = [[UILabel alloc]init];
            contentLab1.font = [UIFont systemFontOfSize:12];
            [self.contentView addSubview:contentLab1];
            self.contentLab1 = contentLab1;
            
            
            //   style2
        }else if ([reuseIdentifier isEqualToString:@"showcomment"]){
            
            UIImageView *userPic2 = [[UIImageView alloc]init];
            userPic2.layer.masksToBounds = YES;
            userPic2.layer.cornerRadius = 15;
            [self.contentView addSubview:userPic2];
            self.userPic2 = userPic2;
            
            UILabel *userName2 = [[UILabel alloc]init];
            userName2.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:userName2];
            self.userName2 = userName2;
            
            UILabel *contentLab2 = [[UILabel alloc]init];
            contentLab2.font = [UIFont systemFontOfSize:12];
            [self.contentView addSubview:contentLab2];
            self.contentLab2 = contentLab2;
            
            self.commentBtn = [[UIButton alloc]init];
            [self.commentBtn setBackgroundImage:[UIImage imageNamed:@"rate_comment_button@2x.png"] forState:UIControlStateNormal];
            [self.contentView addSubview:_commentBtn];
            
            self.commentLab = [[UILabel alloc]init];
            self.commentLab.font = [UIFont systemFontOfSize:12];
            [self.contentView addSubview:_commentLab];
            
            self.supportBtn = [[UIButton alloc]init];
            [self.supportBtn setBackgroundImage:[UIImage imageNamed:@"rate_like_button@3x.png"] forState:UIControlStateNormal];
            [self.contentView addSubview:_supportBtn];
            
            self.supportLab = [[UILabel alloc]init];
            self.supportLab.font = [UIFont systemFontOfSize:12];
            [self.contentView addSubview:_supportLab];
        }  
    }
    [self initLayout];
    return self;
}

//   页面布局
- (void)initLayout{
    
    //   style1
    self.userPic1.frame = CGRectMake(10, 10, 30, 30);
    self.userName1.frame = CGRectMake(50, 10, 200, 30);
    self.timeLab1.frame = CGRectMake(SCREEN_WIDTH-100, 10, 90, 20);
    for (int i = 0; i < 5; i++) {
        UIImageView *image = (UIImageView *)[self.contentView viewWithTag:100 + i];
        image.frame = CGRectMake(10, 50 + (SCREEN_WIDTH - 10)*i, SCREEN_WIDTH - 20, (SCREEN_WIDTH - 20));
    }
    self.contentLab1.frame = CGRectMake(10, 50 + (SCREEN_WIDTH - 10)*5, SCREEN_WIDTH - 20, 100);
    
    
    //  style2
    self.userPic2.frame = CGRectMake(10, 10, 30, 30);
    self.userName2.frame = CGRectMake(50, 10, 200, 30);
    self.contentLab2.frame = CGRectMake(10, 50, SCREEN_WIDTH - 20, 100);
}

//赋值 and 自动换行,计算出cell的高度

-(void)setIntroductionText1:(NSString*)text1{
    
    //获得当前cell高度
    CGRect frame = self.frame;
    //文本赋值
    self.contentLab1.text = text1;
    //设置label的最大行数
    self.contentLab1.numberOfLines = 0;
    CGSize size = CGSizeMake(300, 1000);
    
    CGSize labelSize1 = [self.contentLab1.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    self.contentLab1.frame = CGRectMake(self.contentLab1.frame.origin.x, self.contentLab1.frame.origin.y, labelSize1.width, labelSize1.height);
    
    //计算出自适应的高度
    frame.size.height = _contentLab1.frame.origin.y + _contentLab1.frame.size.height + 10;
    self.frame = frame;
    
}

-(void)setIntroductionText2:(NSString*)text2{
    
    //获得当前cell高度
    CGRect frame = self.frame;
    //文本赋值
    self.contentLab2.text = text2;
    //设置label的最大行数
    self.contentLab2.numberOfLines = 0;
    CGSize size = CGSizeMake(300, 1000);
    
    CGSize labelSize = [self.contentLab2.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    self.contentLab2.frame = CGRectMake(self.contentLab2.frame.origin.x, self.contentLab2.frame.origin.y, labelSize.width, labelSize.height);
    
    self.commentBtn.frame = CGRectMake(195, _contentLab2.frame.origin.y + _contentLab2.frame.size.height + 10, 20, 20);
    self.commentLab.frame = CGRectMake(220, _contentLab2.frame.origin.y + _contentLab2.frame.size.height + 10, 40, 20);
    self.supportBtn.frame = CGRectMake(250, _contentLab2.frame.origin.y + _contentLab2.frame.size.height + 10, 20, 20);
    self.supportLab.frame = CGRectMake(275, _contentLab2.frame.origin.y + _contentLab2.frame.size.height + 10, 40, 20);
    
    //计算出自适应的高度
    frame.size.height = _supportLab.frame.origin.y + _supportLab.frame.size.height + 10;
    self.frame = frame;
    
}



@end
