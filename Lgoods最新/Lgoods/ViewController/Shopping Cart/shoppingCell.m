//
//  shoppingCell.m
//  Lgoods
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "shoppingCell.h"
#import "Header.h"
@implementation shoppingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.t = 0;
        //复选框
        self.circleBtn = [[UIButton alloc]init];
//        self.circleBtn.layer.cornerRadius = 10;
//        self.circleBtn.layer.borderColor = [UIColor grayColor].CGColor;
//        self.circleBtn.layer.borderWidth = 1.0f;
        self.circleBtn.tag = 1001;   //设置tag值
        [self.circleBtn setImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        
        self.circleBtn.adjustsImageWhenHighlighted = NO;   //长按不让背景变成灰色
        
        [self.circleBtn addTarget:self action:@selector(choose1) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.circleBtn];
        
        
        //1.衣服图片
        self.imageclothes = [[UIImageView alloc]init];
        [self.contentView addSubview:self.imageclothes];
        
        //2.衣服名字
        self.clothesName = [[UILabel alloc]init];
        self.clothesName.font = [UIFont systemFontOfSize:15];
        self.clothesName.textAlignment = NSTextAlignmentLeft;
        self.clothesName.numberOfLines = 0;
        [self.contentView addSubview:self.clothesName];
        
        //3.衣服颜色
        self.colorLab = [[UILabel alloc]init];
        self.colorLab.font = [UIFont systemFontOfSize:12];
        self.colorLab.textAlignment = NSTextAlignmentLeft;
        self.colorLab.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.colorLab];
        
        //4.衣服尺寸
        self.sizeLab = [[UILabel alloc]init];
        self.sizeLab.font = [UIFont systemFontOfSize:12];
        self.sizeLab.textAlignment = NSTextAlignmentLeft;
        self.sizeLab.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.sizeLab];
        
        //5.价钱
        self.moneyLab = [[UILabel alloc]init];
        self.moneyLab.font = [UIFont systemFontOfSize:15];
        self.moneyLab.textAlignment = NSTextAlignmentLeft;
        self.moneyLab.textColor = [UIColor redColor];
        [self.contentView addSubview:self.moneyLab];
        
        //6.数量
        self.numberLab = [[UILabel alloc]init];
        self.numberLab.font = [UIFont systemFontOfSize:15];
        self.numberLab.textAlignment = NSTextAlignmentRight;
        self.numberLab.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.numberLab];

    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];

//    self.circleBtn.frame = CGRectMake(15, 40, 20, 20);
    self.circleBtn.frame = CGRectMake(0, 0, 50, 100);
    
    self.imageclothes.frame = CGRectMake(50, 5, 90, 90);
    
    self.clothesName.frame = CGRectMake(50+90+10, 5, WIDTH-160, 40);
    
    self.colorLab.frame = CGRectMake(50+90+10, 50, 70, 20);
    
    self.sizeLab.frame = CGRectMake(50+90+10+75, 50, 70, 20);
    
    self.moneyLab.frame = CGRectMake(50+90+10, 70, 30, 20);
    
    self.numberLab.frame = CGRectMake(WIDTH-60, 70, 50, 20);
    
   
}

- (void)choose1{
   
    
    if (_t==0) {
        [self.circleBtn setImage:[UIImage imageNamed:@"check2.png"] forState:UIControlStateNormal];
        self.t++;
    }else{
       
        [self.circleBtn setImage:[UIImage imageNamed:@"check1.png"] forState:UIControlStateNormal];
        self.t = 0;
    }
    
    
}

@end
