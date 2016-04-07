//
//  NewClothesViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "NewClothesViewController.h"
#import "CiothesTypeTableViewCell.h"
@interface NewClothesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)UITableView *tab;
@property (strong,nonatomic)UIView *vie;
@property (strong,nonatomic)UILabel *titlelab;
@property (strong,nonatomic)UIButton *but;
@property (strong,nonatomic)NSArray *arr;
@end

@implementation NewClothesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //数组装图片
    self.arr=@[@"31.png",@"32.png",@"33.png",@"34.png",@"35.png",@"36.png",@"37.png",@"38.png",@"39.png"];

    
    
    
    self.tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.tab.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tab.delegate=self;
    self.tab.dataSource=self;
    [self.view addSubview:self.tab];
    
    
   //导航栏
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.vie.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:self.vie];
 //返回箭头
    self.but=[[UIButton alloc]initWithFrame:CGRectMake(10, self.vie.frame.size.height-30, 10, 15)];
    [self.but setImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    
    [self.but setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.but addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.but];
    
    
    
    self.titlelab=[[UILabel alloc]initWithFrame:CGRectMake((self.vie.frame.size.width-190)/2, self.vie.frame.size.height-40, 190, 30)];
    self.titlelab.text=@"新品上市";
    self.titlelab.textAlignment=NSTextAlignmentCenter;
    self.titlelab.textColor=[UIColor whiteColor];
    [self.vie addSubview:self.titlelab];
    
    
   
    
    
}


-(void)back{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 9;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 150;
    
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    

    static NSString *str=@"hah";
    CiothesTypeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[CiothesTypeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    cell.imgvie.image=[UIImage imageNamed:_arr[indexPath.row]];
    cell.lab1.text=@"heh";
    cell.lab2.text=@"heh";
    cell.lab3.text=@"heh";
    cell.lab4.text=@"heh";
    cell.lab5.backgroundColor=[UIColor grayColor];
    

    return cell;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
