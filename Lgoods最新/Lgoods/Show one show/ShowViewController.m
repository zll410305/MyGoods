//
//  ShowViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShowViewController.h"
#import "ShowTableViewCell.h"
#import "AddShowViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height
@interface ShowViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic)UIScrollView *bigScroll;

@property (strong, nonatomic)UITableView *showTableView;

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"+" style:UIBarButtonItemStylePlain target:self action:@selector(addShow:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    NSArray *typeArr = @[@"全部",@"精品",@"我的"];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3*i, 64, SCREEN_WIDTH/3, 36)];
        button.tag = 1000 + i;
        [button setTitle:typeArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        if (i == 0) {
            button.selected = YES;
        }
    }
    
    self.bigScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT -149)];
    self.bigScroll.contentSize = CGSizeMake(SCREEN_WIDTH * 3, SCREEN_HEIGHT -149);
    self.bigScroll.delegate = self;
    self.bigScroll.pagingEnabled = YES;
    [self.view addSubview:self.bigScroll];
    
   
    self.showTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 149) style:UITableViewStylePlain];
    self.showTableView.dataSource = self;
    self.showTableView.delegate = self;
    [self.bigScroll addSubview:_showTableView];

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"showCell";
    ShowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[ShowTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.userPic.image = [UIImage imageNamed:@"u=2772435171,1183253776&fm=96&s=F3905C8956226CB5AE18D4DF0300D034.jpg"];
    cell.userName.text = @"有缘人2830";
    cell.showPic.image = [UIImage imageNamed:@"CCBC2898B962280D4EC64589A6B1E647.png"];
    [cell setIntroductionText:@" 其中如果options参数为NSStringDrawingUsesLineFragmentOrigin，那么整个文本将以每行组成的矩形为单位计算整个文本的尺寸。（在这里有点奇怪，因为字体高度大概是13.8，textView中大概有10行文字，此时用该选项计算出来的只有5行，即高度为69，而同时使用NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin却可以得出文字刚好有10行，即高度为138，这里要等iOS7官方的文档出来再看看选项的说明，因为毕竟以上文档是iOS6的东西）\n如果为NSStringDrawingTruncatesLastVisibleLine或者NSStringDrawingUsesDeviceMetric，那么计算文本尺寸时将以每个字或字形为单位来计算。\n如果为NSStringDrawingUsesFontLeading则以字体间的行距（leading，行距：从一行文字的底部到另一行文字底部的间距。）来计算。"];
    cell.timeLab.text = @"20:00";
    cell.commentNum.text = @"0";
    cell.supportNum.text = @"0";
    return cell;
}


- (void)changeType:(UIButton *)sender{
    for (int i = 0; i < 3; i++) {
        UIButton *button = (UIButton *)[self.view viewWithTag:1000 + i];
        if (sender.tag == button.tag) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
    int k = (int)sender.tag - 1000;
    self.showTableView.frame = CGRectMake(SCREEN_WIDTH*k, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 149);
    [self.bigScroll setContentOffset:CGPointMake(SCREEN_WIDTH *k, 0) animated:YES];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int k = (int)self.bigScroll.contentOffset.x/SCREEN_WIDTH;
    for (int i = 0; i < 3; i++) {
        UIButton *button = (UIButton *)[self.view viewWithTag:1000 + i];
        if (k == i) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
    self.showTableView.frame = CGRectMake(SCREEN_WIDTH*k, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 149);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)addShow:(UIButton *)sender{
    AddShowViewController *addShow = [[AddShowViewController alloc]init];
    [self.navigationController pushViewController:addShow animated:YES];
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
