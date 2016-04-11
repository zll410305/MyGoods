//
//  SearViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "SearViewController.h"
#import "HomeViewController.h"
#import "H_requestDateService.h"
#import "ClothesTypeViewController.h"
#import "ShopViewController.h"
#import "WrongViewController.h"
#import "SeachTableViewCell.h"
#import "Myrequst.h"

@interface SearViewController ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)NSMutableArray *mutarr;
@property (strong,nonatomic)NSString *mystr;
@end

@implementation SearViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    [ Myrequst  requst:@"" and:1 andWith:^(NSMutableArray *arr) {
        self.mutarr=[NSMutableArray arrayWithArray:arr];
    }];
    
    
    
    //
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.vie.backgroundColor=[UIColor orangeColor];
    self.but1=[[UIButton alloc]initWithFrame:CGRectMake(10, self.vie.frame.size.height-30, 10, 15)];
    [self.but1 setImage:[UIImage imageNamed:@"jiantou1"] forState:UIControlStateNormal];
    [self.but1 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.but1];
    
    [self.view addSubview:self.vie];
    
    
    
    
    //搜索栏
    self.seactext=[[UITextField alloc]initWithFrame:CGRectMake(80, 28, 190, 25)];
    //第一响应事件
    [self.seactext becomeFirstResponder];
    self.seactext.placeholder=@"输入商品名或店名";
    self.seactext.textAlignment=  NSTextAlignmentCenter;
    self.seactext.layer.cornerRadius=5;
    self.seactext.font=[UIFont systemFontOfSize:12];
    self.seactext.backgroundColor=[UIColor whiteColor];
    self.seactext.delegate=self;
    [self.vie addSubview:self.seactext];
    
    //搜索点击事件
    self.but2=[[UIButton alloc]initWithFrame:CGRectMake(self.vie.frame.size.width-40, self.vie.frame.size.height-40, 30, 30)];
    [self.but2 setTitle:@"搜索" forState:UIControlStateNormal];
    [self.but2 setTitleColor:[UIColor clearColor] forState:UIControlStateHighlighted];
    self.but2.titleLabel.font=[UIFont systemFontOfSize:15];
    [self.but2 addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.but2];
    
    
    
    
    //历史搜索列表
    
    self.vie2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    UILabel *lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 49, self.vie2.frame.size.width-20, 1)];
    lab2.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.vie2 addSubview:lab2];
    self.lab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.vie2.frame.size.width-20, 30)];
    self.lab1.text=@"历史搜索";
    self.lab1.font=[UIFont systemFontOfSize:12];
    [self.vie2 addSubview:self.lab1];
    
    
    
    //历史记录列表
    self.tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114)];
    self.tab.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tab.tableHeaderView=self.vie2;
    [self creat];
    self.tab.delegate=self;
    self.tab.dataSource=self;
    [self.view addSubview:self.tab];
    
    
    
    //清空历史记录列表
    self.delebut=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-60)/2, self.view.frame.size.height-self.tab.frame.origin.y, 60, 20)];
    self.delebut.titleLabel.font=[UIFont systemFontOfSize:12];
    self.delebut.layer.cornerRadius=5;
    self.delebut.layer.borderWidth=1;
    self.delebut.layer.borderColor=[UIColor redColor].CGColor;
    [self.delebut setTitle:@"清空历史" forState:UIControlStateNormal];
    [self.delebut setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.delebut setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self.view addSubview:self.delebut];
    [self.delebut addTarget:self action:@selector(delet:) forControlEvents:UIControlEventTouchUpInside];
    
    //    NSLog(@"%@",self.mutarr);
    
    
}


-(void)delet:(id)sender{
    
    
    [Myrequst requst:@"" and:0 andWith:^(NSMutableArray *arr) {
        self.mutarr=[NSMutableArray arrayWithArray:arr];
    }];
    
    [self.tab reloadData];
    
    
    
}
////监控输入字符串
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//
//
//    NSLog(@"%@",string);
//    return YES;
//
//
//}
-(void)back{
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    
    self.mystr=self.seactext.text;
    
    
    [ Myrequst  requst:self.mystr and:1 andWith:^(NSMutableArray *arr) {
        [self.mutarr removeAllObjects];
        [self.mutarr addObjectsFromArray:arr];
        
        //
    }];
    
    [self creat];
    [self.tab reloadData];
    
    
    
}

//判断有无表头

-(void)creat{
    
    if (self.mutarr.count==0) {
        self.tab.tableHeaderView.hidden=YES;
    }else{
        self.tab.tableHeaderView=self.vie2;
        self.tab.tableHeaderView.hidden=NO;
        
    }
    
    
    
}

-(void)go{
    
    
    //    [H_requestDateService requst:self.seactext.text andwith:^(NSDictionary *dic) {
    //        if (![dic count]==0) {
    //
    //            [self.navigationController pushViewController:[[ClothesTypeViewController alloc]init] animated:YES];
    //
    //        }else{
    //
    //
    //
    //
    //        }
    //    }];
    //
    //
    //    NSLog(@"%@",self.seactext.text);
//    //
//         [self.navigationController pushViewController:[[WrongViewController alloc]init] animated:YES];
    
    
    [self.navigationController pushViewController:[[ShopViewController alloc]init] animated:YES];
    
}


//写入本地plist



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return self.mutarr.count;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 50;
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    static NSString *str=@"a";
    SeachTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[SeachTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.lab.text=self.mutarr[self.mutarr.count-1-indexPath.row];
    cell.lab2.backgroundColor=[UIColor groupTableViewBackgroundColor];
    return cell;
    
}










//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    [self.view endEditing:YES];
//
//
//}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    
    [self.seactext resignFirstResponder];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end

