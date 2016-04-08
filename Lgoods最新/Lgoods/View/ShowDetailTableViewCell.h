//
//  ShowDetailTableViewCell.h
//  Lgoods
//
//  Created by Administrator on 16/4/7.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowDetailTableViewCell : UITableViewCell

//    style1

@property (strong, nonatomic)UIImageView *userPic1;

@property (strong, nonatomic)UILabel *userName1;

@property (strong, nonatomic)UILabel *timeLab1;

@property (strong, nonatomic)NSArray *imageArr;

@property (strong, nonatomic)UILabel *contentLab1;

//    style2

@property (strong, nonatomic)UIImageView *userPic2;

@property (strong, nonatomic)UILabel *userName2;

@property (strong, nonatomic)UILabel *contentLab2;

@property (strong, nonatomic)UIButton *commentBtn;

@property (strong, nonatomic)UILabel *commentLab;

@property (strong, nonatomic)UIButton *supportBtn;

@property (strong, nonatomic)UILabel *supportLab;


-(void)setIntroductionText1:(NSString*)text1;

-(void)setIntroductionText2:(NSString*)text2;

@end
