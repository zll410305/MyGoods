//
//  shoppingCell.h
//  Lgoods
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shoppingCell : UITableViewCell


@property (strong, nonatomic)UIButton *nameBtn2; //订单前面的选择框


@property (strong, nonatomic)UIImageView *imageclothes;  //衣服图片

@property (strong, nonatomic)UILabel *clothesName;  //衣服名字

@property (strong, nonatomic)UILabel *colorLab; //衣服颜色

@property (strong, nonatomic)UILabel *sizeLab;   //衣服尺寸

@property (strong, nonatomic)UILabel *moneyLab;  //价钱

@property (strong, nonatomic)UILabel *numberLab;  //数量
@end
