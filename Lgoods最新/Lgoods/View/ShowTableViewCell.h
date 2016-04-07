//
//  ShowTableViewCell.h
//  Lgoods
//
//  Created by Administrator on 16/4/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowTableViewCell : UITableViewCell

@property (strong, nonatomic)UIImageView *userPic;

@property (strong, nonatomic)UILabel *userName;

@property (strong, nonatomic)UIImageView *showPic;

@property (strong, nonatomic)UILabel *showText;

@property (strong, nonatomic)UILabel *timeLab;

@property (strong, nonatomic)UILabel *commentNum;

@property (strong, nonatomic)UILabel *supportNum;


//给秀一秀内容赋值并且实现自动换行

-(void)setIntroductionText:(NSString*)text;


@end
