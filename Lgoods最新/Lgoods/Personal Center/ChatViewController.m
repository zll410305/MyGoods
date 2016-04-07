//
//  ChatViewController.m
//  Lgoods
//
//  Created by Administrator on 16/3/31.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import <RongIMKit/RongIMKit.h>
#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 27, 30, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    
    self.conversationMessageCollectionView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
//    //是否保存到本地数据库，如果不保存，则下次进入聊天界面将不再显示。
//    BOOL saveToDB = NO;
//    RCMessageContent *warningMessage;
//    RCMessage *insertMessage;
//    if (saveToDB) {
//        // 如果保存到本地数据库，需要调用insertMessage生成消息实体并插入数据库。
//        insertMessage = [[RCIMClient sharedRCIMClient] insertMessage:self.conversationType
//                                                            targetId:self.targetId
//                                                        senderUserId:[RCIM sharedRCIM].currentUserInfo.userId
//                                                          sendStatus:SentStatus_SENT
//                                                             content:warningMessage];
//    } else {
//        // 如果不保存到本地数据库，需要初始化消息实体并将messageId要设置为－1。
//        insertMessage =[[RCMessage alloc] initWithType:self.conversationType
//                                              targetId:self.targetId
//                                             direction:MessageDirection_SEND
//                                             messageId:-1
//                                               content:warningMessage];
//        
//    }
//    
//    // 在当前聊天界面插入该消息
//    [self appendAndDisplayMessage:insertMessage];
    
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
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
