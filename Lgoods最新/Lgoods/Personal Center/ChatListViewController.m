//
//  ChatListViewController.m
//  Lgoods
//
//  Created by Administrator on 16/3/31.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ChatListViewController.h"
#import "ChatViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
@interface ChatListViewController ()

@end

@implementation ChatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 27, 30, 30)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    
    self.conversationListTableView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height - 44);
    self.conversationListTableView.tableFooterView = [[UIView alloc]init];
    // Do any additional setup after loading the view.
}

- (void)backView{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (instancetype)init{
    self=  [super init];
    if (self) {
        [self setDisplayConversationTypes:@[@(ConversationType_PRIVATE)]];
    }
    
    
    return  self;
}

- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType
         conversationModel:(RCConversationModel *)model
               atIndexPath:(NSIndexPath *)indexPath{
    
    ChatViewController *sa = [[ChatViewController alloc]init];
    sa.conversationType = model.conversationType;
    sa.targetId = model.targetId;
    sa.title =  @"test";
    [self.navigationController pushViewController:sa animated:YES];
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
