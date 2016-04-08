//
//  ShopDetailViewController.m
//  Lgoods
//
//  Created by administrator on 16/4/7.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShopDetailViewController.h"

@interface ShopDetailViewController ()

@end

@implementation ShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.vie.backgroundColor=[UIColor orangeColor];
    self.leftbut=[[UIButton alloc]initWithFrame:CGRectMake(10, self.vie.frame.size.height-30, 10, 15)];
    [self.leftbut setImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    
    [self.leftbut setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [self.leftbut addTarget:self action:@selector(back2) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.leftbut];
    
    [self.view addSubview:self.vie];
    
    
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(125,self.vie.frame.size.height-37 , 80, 30)];
    lab.text=@"店铺详情";
    lab.textColor=[UIColor whiteColor];
    lab.font=[UIFont systemFontOfSize:18];
    [self.vie addSubview:lab];
    
//
    
    UIView *vie2=[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 100)];
    vie2.backgroundColor=[UIColor whiteColor];
    UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 100, 80)];
    img.layer.borderWidth=0.5;
    img.layer.borderColor=[UIColor grayColor].CGColor ;
    img.image=[UIImage imageNamed:@"shop1.jpg"];
    [vie2 addSubview:img];
    [self.view addSubview:vie2];
    
    
    
    UILabel *shoplab=[[UILabel alloc]initWithFrame:CGRectMake(120, 15, 120, 30)];
    shoplab.font=[UIFont systemFontOfSize:15];
    shoplab.text=@"美特斯邦威旗舰店";
    [vie2 addSubview:shoplab];
    
    
    
    
    
    
    UIView *vie3=[[UIView alloc]initWithFrame:CGRectMake(0, 184, self.view.frame.size.width, 150)];
    vie3.backgroundColor=[UIColor whiteColor];
    UILabel *dresslab=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 40)];
    dresslab.text=@"店铺地址:";
    
     UILabel *pholab=[[UILabel alloc]initWithFrame:CGRectMake(10, 60, 80, 40)];
     pholab.text=@"联系电话:";
    
     UILabel *dress2lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 110, 80, 40)];
    
    
    
    
    UILabel *lab1=[[UILabel alloc]initWithFrame:CGRectMake(120, 10, 170, 40)];
    lab1.text=@"苏州市观前街168号";
    
    
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(120, 60, 170, 40)];
    
    lab2.text=@"12345678911";
    
    
    UILabel *lab3=[[UILabel alloc]initWithFrame:CGRectMake(120, 110, 170, 40)];
    lab3.text=@"zhh410305@163.com";
    
    
    
    
     dress2lab.text=@"邮箱:";
    [vie3 addSubview:dresslab];
    [vie3 addSubview:dress2lab];
    [vie3 addSubview:pholab];
    [vie3 addSubview:lab1];
    [vie3 addSubview:lab2];
    [vie3 addSubview:lab3];
    
    [self.view addSubview:vie3];
   
}



-(void)back2{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
