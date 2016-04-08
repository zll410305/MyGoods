//
//  ShowDetailViewController.m
//  Lgoods
//
//  Created by Administrator on 16/4/7.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShowDetailViewController.h"
#import "ShowDetailTableViewCell.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
@interface ShowDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UITableView *showDetailTable;

@property (strong, nonatomic)NSArray *imageArr;

@end

@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageArr = @[@"CCBC2898B962280D4EC64589A6B1E647.png",@"CCBC2898B962280D4EC64589A6B1E647.png",@"CCBC2898B962280D4EC64589A6B1E647.png",@"CCBC2898B962280D4EC64589A6B1E647.png",@"CCBC2898B962280D4EC64589A6B1E647.png"];
    
    self.showDetailTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.showDetailTable.dataSource = self;
    self.showDetailTable.delegate = self;
    [self.view addSubview:_showDetailTable];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return 30;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier;
    if (indexPath.section == 0) {
        identifier = @"showdetail";
    }else{
        identifier = @"showcomment";
    }
    ShowDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ShowDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.section == 0) {
        cell.userPic1.image = [UIImage imageNamed:@"CCBC2898B962280D4EC64589A6B1E647.png"];
        cell.userName1.text = @"张伟伟";
        cell.timeLab1.text = @"5小时前";
        for (int i = 0; i < _imageArr.count; i++) {
            UIImageView *image = (UIImageView *)[cell viewWithTag:100 +i];
            image.image = [UIImage imageNamed:_imageArr[i]];
        }
        [cell setIntroductionText1:@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈"];
    }else{
        cell.userPic2.image = [UIImage imageNamed:@"CCBC2898B962280D4EC64589A6B1E647.png"];
        cell.userName2.text = @"张伟伟";
        [cell setIntroductionText2:@"呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵"];
        cell.commentLab.text = @"10";
        cell.supportLab.text = @"200";
    }
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    headView.backgroundColor = [UIColor whiteColor];
    UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 24, 24)];
    imgview.image = [UIImage imageNamed:@"rate_comment_button@2x.png"];
    [headView addSubview:imgview];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(44, 10, 160, 24)];
    titleLab.font = [UIFont systemFontOfSize:15];
    [headView addSubview:titleLab];
    if (section == 1) {
        titleLab.text = @"全部评论（20）";
    }
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 44.0;
    }else{
        return 0.0;
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    NSString *title = @"全部评论（20）";
//    return title;
//}

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
