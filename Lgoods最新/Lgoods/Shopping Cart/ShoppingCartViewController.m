//
//  ShoppingCartViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "Header.h"
#import "shoppingCell.h"

@interface ShoppingCartViewController ()

@property (strong, nonatomic)NSMutableArray *mutArr;

@end

@implementation ShoppingCartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    
    self.mutArr = [NSMutableArray arrayWithCapacity:0]; //
    
    
    self.shopTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-49-40) style:UITableViewStylePlain];
    self.shopTable.delegate = self;
    self.shopTable.dataSource = self;
//    self.shopTable.tableFooterView = [[UIView alloc]init];  //去掉多余的cell
    [self.view addSubview:self.shopTable];
    
    UIView *shopView = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT-49-40, WIDTH, 40)];
    shopView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:shopView];
    
   UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 20, 20)];
    btn.layer.cornerRadius = 10;
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [UIColor grayColor].CGColor;
    [btn addTarget:self action:@selector(choose) forControlEvents:UIControlEventTouchUpInside];
    [shopView addSubview:btn];
    
    //全选
    UILabel *chooseLab = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 50, 20)];
    chooseLab.text = @"全选";
    chooseLab.font = [UIFont systemFontOfSize:13];
    chooseLab.textAlignment = NSTextAlignmentLeft;
    [shopView addSubview:chooseLab];
    
    //合计
    UILabel *countLab = [[UILabel alloc]initWithFrame:CGRectMake(150, 10, 30, 20)];
    countLab.text = @"合计:";
    countLab.font = [UIFont systemFontOfSize:13];
    countLab.textAlignment = NSTextAlignmentRight;
    [shopView addSubview:countLab];
    
    //countMoney
    UILabel *countMoney = [[UILabel alloc]initWithFrame:CGRectMake(185, 10, 60, 20)];
    countMoney.text = @"¥0.00";
    countMoney.textColor = [UIColor redColor];
    countMoney.font = [UIFont systemFontOfSize:13];
    countMoney.textAlignment = NSTextAlignmentLeft;
    [shopView addSubview:countMoney];
    
    //结算
    UIButton *countBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-70, 0, 70, 40)];
    [countBtn setTitle:@"结算" forState:UIControlStateNormal];
    countBtn.backgroundColor = [UIColor orangeColor];
    countBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [countBtn addTarget:self action:@selector(choose) forControlEvents:UIControlEventTouchUpInside];
    [shopView addSubview:countBtn];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 5;
    }
}

//可以选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//划动删除
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.shopTable setEditing:YES animated:YES];
    [_mutArr removeObjectAtIndex:indexPath.row];
    [self.shopTable reloadData];
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"shopping";
    shoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[shoppingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.imageclothes.image = [UIImage imageNamed:@"shopping.jpg"];
    cell.clothesName.text = @"海澜之家海澜之家海澜之家海澜之家海澜之家海澜之家海澜之家";
    cell.colorLab.text = @"颜色:蓝色";
    cell.sizeLab.text = @"尺码:XL";
    cell.moneyLab.text = @"¥45";
    cell.numberLab.text = @"x1";
    
    return cell;
}

@end
