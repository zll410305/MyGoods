//
//  EvaluateTableViewCell.h
//  Lgoods
//
//  Created by Administrator on 16/4/1.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluateTableViewCell : UITableViewCell

@property (strong, nonatomic)UIImageView *userPic;

@property (strong, nonatomic)UILabel *userName;

@property (strong, nonatomic)UILabel *time;

@property (strong, nonatomic)UILabel *content;

-(void)setIntroductionText:(NSString*)text;

@end
