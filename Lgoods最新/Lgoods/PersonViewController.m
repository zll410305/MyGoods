//
//  PersonViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "PersonViewController.h"
#import <RongIMKit/RongIMKit.h>


#define IMKEY @"z3v5yqkbvtle0"
#define TOKEN @"6Ml3fJv8ku5Avi28mV+VEfxDftxsmBLLTlu9eF3yvtSQErfIAoEst6bpI0dt4wV8aYhO1oO+8A1AoodvsMgtaPVZREzlJ4Cz"
@interface PersonViewController ()<RCIMUserInfoDataSource,UITableViewDataSource,UITableViewDelegate>

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.view.backgroundColor = [UIColor whiteColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.vie.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:self.vie];
    
    
    
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(125,self.vie.frame.size.height-37 , 80, 30)];
    lab.text=@"个人中心";
    lab.textColor=[UIColor whiteColor];
    lab.font=[UIFont systemFontOfSize:18];
    [self.vie addSubview:lab];
    
    
    
    
    //数组
    self.arr=@[@"我的消息",@"我的收藏",@"我的穿搭秀",@"关于"];

    
    //tab
    
    self.tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    self.tab.delegate=self;
    self.tab.dataSource=self;
    self.tab.scrollEnabled=NO;
    self.tab.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tab];
    
    
    
    
}



-(void)test{
    
    [[RCIM sharedRCIM] initWithAppKey:IMKEY];
    
    [[RCIM sharedRCIM] connectWithToken:TOKEN success:^(NSString *userId) {
        [[RCIM sharedRCIM] setUserInfoDataSource:self];
        NSLog(@"登陆成功。当前登录的用户ID：%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"登陆的错误码为:%ld", status);
    } tokenIncorrect:^{
        //token过期或者不正确。
        //如果设置了token有效期并且token过期，请重新请求您的服务器获取新的token
        //如果没有设置token有效期却提示token错误，请检查您客户端和服务器的appkey是否匹配，还有检查您获取token的流程。
        NSLog(@"token错误");
    }];

    
    
}


- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
    
    if ([userId isEqualToString:@"1234567"]) {
        RCUserInfo *userinfo = [[RCUserInfo alloc]init];
        userinfo.userId = userId;
        userinfo.name = @"张乐乐";
        userinfo.portraitUri = @"http://e.hiphotos.baidu.com/image/h%3D200/sign=f1bdcdf64010b912a0c1f1fef3fcfcb5/8326cffc1e178a8285adf5edf103738da877e8ee.jpg";
        return completion(userinfo);
    }
    RCUserInfo *userinfo1 = [[RCUserInfo alloc]init];
    userinfo1.userId = userId;
    userinfo1.name = @"张伟伟";
    userinfo1.portraitUri = @"http://b.hiphotos.baidu.com/image/h%3D300/sign=c0b5f5edf103738dc14a0a22831ab073/08f790529822720e754768b77ccb0a46f31fabf6.jpg";
    return completion(userinfo1);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 1;
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
    
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat i;
    if (section==0) {
        i=120;
    }else{
        
        i=10;
    }
    return i;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 50;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str=@"e";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=self.arr[indexPath.section];
            break;
        case 1:
            cell.textLabel.text=self.arr[indexPath.section];
            break;

        case 2:
            cell.textLabel.text=self.arr[indexPath.section];
            break;

        case 3:
            cell.textLabel.text=self.arr[indexPath.section];
            break;

            
        default:
            break;
    }
    return cell;
    
    
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *heaview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tab.frame.size.width, 120)];
    if (section==0) {
        
        
        self.vie2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tab.frame.size.width, 120)];
        
        UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(0, 110, self.vie2.frame.size.width, 10)];
        vie.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self.vie2 addSubview:vie];

        self.vie2.backgroundColor=[UIColor whiteColor];
        heaview=self.vie2;
    }else{
        
        UIView *vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tab.frame.size.width, 10)];
        vie.backgroundColor=[UIColor groupTableViewBackgroundColor];

        heaview=vie;
        
    }
    
   
    return heaview;
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

@end
