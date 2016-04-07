//
//  ClothesTypeViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ClothesTypeViewController.h"
#import "CiothesTypeTableViewCell.h"
@interface ClothesTypeViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ClothesTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.vie.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:self.vie];
    
    
    
    self.clttext=[[UITextField alloc]initWithFrame:CGRectMake(80, 28, 190, 25)];
    self.clttext.backgroundColor=[UIColor whiteColor];
    self.clttext.textAlignment=  NSTextAlignmentCenter;
    self.clttext.layer.cornerRadius=5;
    self.clttext.placeholder=@"搜索";
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 15, 15)];
    imge.image=[UIImage imageNamed:@"搜索"];
    [self.clttext addSubview:imge];

    self.clttext.font=[UIFont systemFontOfSize:12];
    self.clttext.delegate=self;
    [self.vie addSubview:self.clttext];
    
    
    self.leftbut=[[UIButton alloc]initWithFrame:CGRectMake(10, self.vie.frame.size.height-40, 30, 30)];
    [self.leftbut setTitle:@"返回" forState:UIControlStateNormal];
    self.leftbut.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.leftbut addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.leftbut];
    
    
    self.lab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.lab.delegate=self;
    self.lab.dataSource=self;
    [self.view addSubview:self.lab];
    
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    return NO;
    
}

-(void)back{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 150;
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 10;
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str=@"hehe";

    CiothesTypeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str ];
    if (cell==nil) {
        cell=[[CiothesTypeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        cell.lab1.text=@"heh";
        cell.lab2.text=@"heh";
        cell.lab3.text=@"heh";
        cell.lab4.text=@"heh";
        cell.lab5.frame=CGRectMake(0, 149, self.view.frame.size.width, self.lab.frame.size.width);
        cell.lab5.backgroundColor=[UIColor groupTableViewBackgroundColor];
    }
    
    
    
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
