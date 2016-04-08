//
//  ShowTableViewCell.m
//  Lgoods
//
//  Created by Administrator on 16/4/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShowTableViewCell.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ShowTableViewCell ()

@end

@implementation ShowTableViewCell

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
        
        self.showPic = [[UIImageView alloc]init];
        [self.contentView addSubview:_showPic];
        
        self.showText = [[UILabel alloc]init];
        self.showText.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_showText];
        
        self.timeImage = [[UIImageView alloc]init];
        self.timeImage.image = [UIImage imageNamed:@"historyIcon@2x.png"];
        [self.contentView addSubview:_timeImage];
        
        self.timeLab = [[UILabel alloc]init];
        self.timeLab.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_timeLab];
        
        self.commentBtn = [[UIButton alloc]init];
        [self.commentBtn setBackgroundImage:[UIImage imageNamed:@"rate_comment_button@2x.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_commentBtn];
        
        self.commentNum = [[UILabel alloc]init];
        self.commentNum.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_commentNum];
        
        self.supportBtn = [[UIButton alloc]init];
        [self.supportBtn setBackgroundImage:[UIImage imageNamed:@"rate_like_button@3x.png"] forState:UIControlStateNormal];
        [self.contentView addSubview:_supportBtn];
        
        self.supportNum = [[UILabel alloc]init];
        self.supportNum.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_supportNum];
        [self initLayout];
    }
    return self;
}

- (void)initLayout{
    self.userPic.frame = CGRectMake(10, 10, 30, 30);
    self.userName.frame = CGRectMake(50, 10, 200, 30);
    self.showPic.frame = CGRectMake(10, 50, SCREEN_WIDTH - 20, SCREEN_WIDTH - 20);
    self.showText.frame = CGRectMake(10, 60 + SCREEN_WIDTH - 20, SCREEN_WIDTH - 20, 100);
}

//赋值 and 自动换行,计算出cell的高度

-(void)setIntroductionText:(NSString*)text{
    
    //获得当前cell高度
    CGRect frame = self.frame;
    //文本赋值
    self.showText.text = text;
    //设置label的最大行数
    self.showText.numberOfLines = 0;
    CGSize size = CGSizeMake(300, 1000);
    
//    NSDictionary *attributes = [self settinggattributesWithLineSpacing:4 FirstLineHeadIndent:12*2 Font:[UIFont systemFontOfSize:12] TextColor:[UIColor blackColor]];
    
    CGSize labelSize = [self.showText.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size;
    self.showText.frame = CGRectMake(self.showText.frame.origin.x, self.showText.frame.origin.y, labelSize.width, labelSize.height);
    
    self.timeImage.frame = CGRectMake(10, _showText.frame.origin.y + _showText.frame.size.height + 10, 20, 20);
    
    self.timeLab.frame = CGRectMake(35, _showText.frame.origin.y + _showText.frame.size.height + 10, 100, 20);
    self.commentBtn.frame = CGRectMake(195, _showText.frame.origin.y + _showText.frame.size.height + 10, 20, 20);
    self.commentNum.frame = CGRectMake(220, _showText.frame.origin.y + _showText.frame.size.height + 10, 40, 20);
    self.supportBtn.frame = CGRectMake(250, _showText.frame.origin.y + _showText.frame.size.height + 10, 20, 20);
    self.supportNum.frame = CGRectMake(275, _showText.frame.origin.y + _showText.frame.size.height + 10, 40, 20);

    //计算出自适应的高度
    frame.size.height = _showText.frame.origin.y + _showText.frame.size.height + 10 +30;
    self.frame = frame;
    
}

////  段落样式
//- (NSDictionary *)settinggattributesWithLineSpacing:(CGFloat)lineSpacing FirstLineHeadIndent:(CGFloat)firstLineHeadIndent Font:(UIFont *)font TextColor:(UIColor *)textColor{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
//    paragraphStyle.lineSpacing = lineSpacing;
//    paragraphStyle.firstLineHeadIndent = firstLineHeadIndent;
//    NSDictionary *attributesDic = @{NSFontAttributeName:font,
//                                    NSParagraphStyleAttributeName:paragraphStyle,
//                                    NSForegroundColorAttributeName:textColor
//                                    };
//    return attributesDic;
//}

@end
