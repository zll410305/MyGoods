//
//  EvaluateViewController.m
//  Lgoods
//
//  Created by Administrator on 16/4/1.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "EvaluateViewController.h"
#import "EvaluateTableViewCell.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface EvaluateViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UITableView *evaluateTable;

@property (strong, nonatomic)NSArray *temparr;

@end

@implementation EvaluateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.temparr = @[@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈",
                     @"哈哈哈哈哈哈哈哈哈哈哈哈哈"
                     ];
    
    self.evaluateTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.evaluateTable.dataSource = self;
    self.evaluateTable.delegate = self;
    [self.view addSubview:self.evaluateTable];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 44)];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    // Do any additional setup after loading the view.
}

// 返回
- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:_evaluateTable cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"evaluatecell"];
    if (cell == nil) {
        cell = [[EvaluateTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"evaluatecell"];
    }
    cell.userPic.image = [UIImage imageNamed:@"u=2772435171,1183253776&fm=96&s=F3905C8956226CB5AE18D4DF0300D034.jpg"];
    cell.userName.text = @"张乐乐";
    cell.time.text = @"2016-12-31 12:00:00";
    [cell setIntroductionText: _temparr[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
