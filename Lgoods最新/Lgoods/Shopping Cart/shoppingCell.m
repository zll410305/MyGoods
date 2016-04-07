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
        
        //2.订单前面的选择框
        self.nameBtn2 = [[UIButton alloc]init];
        self.nameBtn2.layer.cornerRadius = 10;
        self.nameBtn2.layer.borderWidth = 1.0f;
        self.nameBtn2.layer.borderColor = [UIColor grayColor].CGColor;
        [self.nameBtn2 addTarget:self action:@selector(choose2) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.nameBtn2];
        
      
        //4.衣服图片
        self.imageclothes = [[UIImageView alloc]init];
//        self.imageclothes.image = [UIImage imageNamed:@"shopping.jpg"];
        [self.contentView addSubview:self.imageclothes];
        
        //5.衣服名字
        self.clothesName = [[UILabel alloc]init];
        self.clothesName.font = [UIFont systemFontOfSize:15];
        self.clothesName.textAlignment = NSTextAlignmentLeft;
        self.clothesName.numberOfLines = 0;
//        self.clothesName.text = @"海澜之家海澜之家海澜之家海澜之家海澜之家海澜之家海澜之家";
        [self.contentView addSubview:self.clothesName];
        
        //6.衣服颜色
        self.colorLab = [[UILabel alloc]init];
        self.colorLab.font = [UIFont systemFontOfSize:12];
        self.colorLab.textAlignment = NSTextAlignmentLeft;
        self.colorLab.textColor = [UIColor grayColor];
//        self.colorLab.text = @"颜色:蓝色";
        [self.contentView addSubview:self.colorLab];
        
        //7.衣服尺寸
        self.sizeLab = [[UILabel alloc]init];
        self.sizeLab.font = [UIFont systemFontOfSize:12];
        self.sizeLab.textAlignment = NSTextAlignmentLeft;
        self.sizeLab.textColor = [UIColor grayColor];
//        self.sizeLab.text = @"尺码:XL";
        [self.contentView addSubview:self.sizeLab];
        
        //8.价钱
        self.moneyLab = [[UILabel alloc]init];
        self.moneyLab.font = [UIFont systemFontOfSize:15];
        self.moneyLab.textAlignment = NSTextAlignmentLeft;
        self.moneyLab.textColor = [UIColor redColor];
//        self.moneyLab.text = @"¥45";
        [self.contentView addSubview:self.moneyLab];
        
        //9.数量
        self.numberLab = [[UILabel alloc]init];
        self.numberLab.font = [UIFont systemFontOfSize:15];
        self.numberLab.textAlignment = NSTextAlignmentRight;
        self.numberLab.textColor = [UIColor grayColor];
//        self.numberLab.text = @"x1";
        [self.contentView addSubview:self.numberLab];

    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
 
    self.nameBtn2.frame = CGRectMake(15, 40, 20, 20);  //2.
    
    
    self.imageclothes.frame = CGRectMake(50, 5, 90, 90);  //4.
    
    self.clothesName.frame = CGRectMake(50+90+10, 5, WIDTH-160, 40); //5.
    
    self.colorLab.frame = CGRectMake(50+90+10, 50, 70, 20);
    
    self.sizeLab.frame = CGRectMake(50+90+10+75, 50, 70, 20);
    
    self.moneyLab.frame = CGRectMake(50+90+10, 70, 30, 20);
    
    self.numberLab.frame = CGRectMake(WIDTH-60, 70, 50, 20);
}
@end
