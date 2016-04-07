//
//  WrongViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "WrongViewController.h"
#import "CiothesTypeTableViewCell.h"
#import "SearViewController.h"
@interface WrongViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>


@end

@implementation WrongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.vie.backgroundColor=[UIColor orangeColor];
    self.leftbut=[[UIButton alloc]initWithFrame:CGRectMake(10, self.vie.frame.size.height-30, 10, 15)];
    [self.leftbut setImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    
    [self.leftbut setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [self.leftbut addTarget:self action:@selector(back2) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.leftbut];
    
    [self.view addSubview:self.vie];
    
    
    
    self.clttext=[[UITextField alloc]initWithFrame:CGRectMake(80, 28, 190, 25)];
    self.clttext.backgroundColor=[UIColor whiteColor];
    self.clttext.textAlignment=  NSTextAlignmentCenter;
    self.clttext.layer.cornerRadius=5;
    self.clttext.placeholder=@"搜索";
    self.clttext.leftView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"搜索.png"]];
    
   
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 15, 15)];
    imge.image=[UIImage imageNamed:@"搜索"];
     self.clttext.font=[UIFont systemFontOfSize:12];
    self.clttext.delegate=self;

    [self.clttext addSubview:imge];
    [self.vie addSubview:self.clttext];
    
    
    
    
    //组头view
    self.vie2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    
    //提示字
    self.lab=[[UILabel alloc]initWithFrame:CGRectMake(60, 20, self.view.frame.size.width-120, 20)];
    self.lab.text=@"对不起没有找到相关宝贝";
    self.lab.font=[UIFont systemFontOfSize:12];
    [self.vie2 addSubview:self.lab];
    
    //
    self.img=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10 , 40, 40)];
    self.img.image=[UIImage imageNamed:@"cry.png"];
    [self.vie2 addSubview:self.img];
    
    
    self.arr=@[@"31.png",@"32.png",@"33.png",@"34.png",@"35.png",@"36.png",@"37.png",@"38.png",@"39.png"];
    
    self.tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.tab.tableHeaderView=self.vie2;
    self.tab.delegate=self;
    self.tab.dataSource=self;
    [self.view addSubview:self.tab];
}
-(void)back2{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    SearViewController *sear = [[SearViewController alloc]init];
    sear.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:sear animated:YES];
    
    return NO;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 9;
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 150;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str=@"zh";
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
