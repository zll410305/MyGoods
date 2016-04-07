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
@interface PersonViewController ()<RCIMUserInfoDataSource>

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
     self.view.backgroundColor = [UIColor whiteColor];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
