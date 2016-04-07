//
//  ClassViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ClassViewController.h"
#import "ClassTableViewCell.h"
#import "ClasssTypeTableViewCell.h"
#import "SearViewController.h"
#import "MyNavigation.h"
@interface ClassViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) MyNavigation *mynav;//自定义导航栏
@end

@implementation ClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor orangeColor];
    //上导航
    self.mynav=[[MyNavigation alloc]initWithBgimg:nil andWithTitlelab:nil andWithtitleimg:nil andWithLeftbut:nil andWithRight:nil];
    
    [self.view addSubview:self.mynav];
    // 搜索栏
    self.seatext=[[UITextField alloc]initWithFrame:CGRectMake(80,28, 190, 25)];
    self.seatext.backgroundColor=[UIColor whiteColor];
    self.seatext.textAlignment=  NSTextAlignmentCenter;
    self.seatext.layer.cornerRadius=5;
    self.seatext.placeholder=@"搜索";
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 15, 15)];
    imge.image=[UIImage imageNamed:@"搜索"];
    [self.seatext addSubview:imge];
    self.seatext.leftViewMode=UITextFieldViewModeAlways;
    self.seatext.font=[UIFont systemFontOfSize:12];
    self.seatext.delegate=self;
    [self.mynav addSubview:self.seatext];
    
    //装请求过来的商铺数据
    
    
    self.muarr=[NSMutableArray arrayWithCapacity:0];
    [self.muarr addObject:@"常熟步行街mogao店"];
    [self.muarr addObject:@"雅贝尔（观前街店）"];
    [self.muarr addObject:@"美特斯邦威"];
    [self.muarr addObject:@"NIKE"];
    [self.muarr addObject:@"海澜之家"];
    
    //衣服类型
    
    self.typearr=@[@"女上衣",@"女裤",@"男上衣",@"男裤"];
    
    //店铺列表
    self.tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 120, self.view.frame.size.height-64)];
    self.tab.tag=200;
    self.tab.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tab.delegate=self;
    self.tab.dataSource=self;
    [self.view addSubview:self.tab];
    
    //衣服种类列表
    self.tab1=[[UITableView alloc]initWithFrame:CGRectMake(121, 64, self.view.frame.size.width-121, self.view.frame.size.height-64)];
    self.tab1.tag=201;
    self.tab1.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tab1.delegate=self;
    self.tab1.dataSource=self;
    [self.view addSubview:self.tab1];

}
//不允许编辑跳转搜索页面
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    SearViewController *sear = [[SearViewController alloc]init];
    sear.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:sear animated:YES];
    
    return NO;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    long  int i=0;
    if (tableView.tag==200) {
        i= self.muarr.count;
    }else if (tableView.tag==201){
        i=self.typearr.count;
    }
    return i;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat i;
    if (tableView.tag==200) {
        i= 70;
    }else if (tableView.tag==201){
        i=180;
    }
    return i;
    
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag==200) {
        static NSString *str=@"b";
        ClassTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
        if (cell==nil) {
            cell=[[ClassTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        
        cell.lab.text=self.muarr[indexPath.row];
        cell.lab.font=[UIFont systemFontOfSize:12];
        cell.lab2.backgroundColor=[UIColor groupTableViewBackgroundColor];
        return cell;
    }else{
        
        static NSString *str1=@"c";
        ClasssTypeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str1];
        if (cell==nil) {
            cell=[[ClasssTypeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str1];
        }
        
        cell.typelab.text=self.typearr[indexPath.row];
        cell.typelab2.backgroundColor=[UIColor groupTableViewBackgroundColor];
        
        return cell;
    }
    
    
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
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
