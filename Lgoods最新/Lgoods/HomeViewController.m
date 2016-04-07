//
//  HomeViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeScroDetial.h"
#import "H_CollectionViewCell1.h"
#import "H_CollectionViewCell2.h"
#import "DetailViewController.h"
#import "MoreViewController.h"
#import "H_requestDateService.h"
#import "MyNavigation.h"
#import "CityListView.h"
#import "AppDelegate.h"
#import "SearViewController.h"
#import "NewClothesViewController.h"
#import "ChatListViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>

@property (strong, nonatomic)UICollectionView *homeCollection;//

@property (strong, nonatomic)UIScrollView *topScrollerView;//

@property (strong, nonatomic)NSMutableArray *discountarr;// 天天活动数据

@property (strong, nonatomic)NSDictionary *newarr;// 新品数据

@property (strong, nonatomic) MyNavigation *mynav;//自定义导航栏

@property (strong, nonatomic)UITextField *seatext;//收索栏

@property (strong, nonatomic) UIView *vie;//页面

@end

@implementation HomeViewController

// 获取城市
- (void)getCityName:(NSString *)cityName{
    [self.mynav.leftbut setTitle:cityName forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
     self.mynav=[[MyNavigation alloc]initWithBgimg:nil andWithTitlelab:nil andWithtitleimg:nil andWithLeftbut:@"苏州" andWithRight:@"消息1"];
    
    [self.view addSubview:self.mynav];
    [self.mynav.leftbut addTarget:self action:@selector(chooseCity) forControlEvents:UIControlEventTouchUpInside];
    [self.mynav.rightbut addTarget:self action:@selector(showChatList) forControlEvents:UIControlEventTouchUpInside];
    
    // 搜索栏
    self.seatext=[[UITextField alloc]initWithFrame:CGRectMake(80, 28, 190, 25)];
    self.seatext.backgroundColor=[UIColor whiteColor];
    self.seatext.textAlignment=  NSTextAlignmentCenter;
    self.seatext.layer.cornerRadius=5;
    self.seatext.placeholder=@"搜索";
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 15, 15)];
    imge.image=[UIImage imageNamed:@"搜索"];
    [self.seatext addSubview:imge];

    self.seatext.font=[UIFont systemFontOfSize:12];
    self.seatext.delegate=self;
    [self.mynav addSubview:self.seatext];


    
    self.i = 0;
    self.a = 0;
    
    
    //  确定是水平滚动还是垂直滚动
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    // 设置最小间距 左右
    [flowLayout setMinimumInteritemSpacing:1.0];
    
    // 设置最小间距 上下
    [flowLayout setMinimumLineSpacing:3];
    
  
    self.homeCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0,64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) collectionViewLayout:flowLayout];
    self.homeCollection.delegate = self;
    self.homeCollection.dataSource = self;
    self.homeCollection.contentInset = UIEdgeInsetsMake(WIDTH*NINE, 0, 0, 0);
    [self.homeCollection setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    // 注册Cell，必须有
    [self.homeCollection registerClass:[H_CollectionViewCell1 class] forCellWithReuseIdentifier:@"homeCollectionCell1"];
    [self.homeCollection registerClass:[H_CollectionViewCell2 class] forCellWithReuseIdentifier:@"homeCollectionCell2"];
    
    // 注册ReusableView，设置组名
    [self.homeCollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"001"];
    
    [self.view addSubview:_homeCollection];
    
    [self views];
    
    [self timeStar];
    
}

// 显示消息列表
- (void)showChatList{
    ChatListViewController *list = [[ChatListViewController alloc]init];
    list.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:list animated:YES];
}


//不允许编辑跳转搜索页面
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    SearViewController *sear = [[SearViewController alloc]init];
    sear.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:sear animated:YES];
    
    return NO;
    
}


//创建的view
- (void)views{
    self.viewScro = [[UIView alloc]initWithFrame:CGRectMake(0, -WIDTH*NINE, WIDTH, WIDTH*NINE)];
    self.viewScro.backgroundColor = [UIColor grayColor];
    [self.homeCollection addSubview:_viewScro];
    
    //UIScrollView
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH*NINE)];
    self.scroll.delegate = self;
    self.scroll.pagingEnabled = YES;   //滑动
    self.arrPics = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    
    self.scroll.contentSize = CGSizeMake(WIDTH*_arrPics.count, WIDTH*NINE);  //定义花布
    
    for (int i=0; i<_arrPics.count; i++) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.frame = CGRectMake(WIDTH * i, 0, WIDTH, WIDTH*NINE);
        imgView.image = [UIImage imageNamed:self.arrPics[i]];
        imgView.userInteractionEnabled = YES;
        [self.scroll addSubview:imgView];
    }
    
    [self.viewScro addSubview:self.scroll];
    
    self.scroll.showsHorizontalScrollIndicator = NO;
    
    self.page = [[UIPageControl alloc]initWithFrame:CGRectMake((WIDTH-20)/2, WIDTH*NINE-15, 5, 5)];
    self.page.numberOfPages = self.arrPics.count - 1;
    self.page.currentPageIndicatorTintColor = [UIColor redColor];  //当前颜色
    self.page.pageIndicatorTintColor = [UIColor whiteColor];   //未选中的颜色
    [self.viewScro addSubview:self.page];
    
    //添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hand:)];
    tapGesture.numberOfTapsRequired = 1;  //点击1次
    tapGesture.numberOfTouchesRequired = 1;  //手指数
    self.scroll.userInteractionEnabled =YES;
    [self.scroll addGestureRecognizer:tapGesture];
    
    
    
}

//手指动作
- (void)hand:(UITapGestureRecognizer *)tapGesture{
    
    HomeScroDetial *homeScro = [[HomeScroDetial alloc]init];
    
    [self.navigationController pushViewController:homeScro animated:YES];
  
}
// 计时器开始
- (void)timeStar{
    
    self.times = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(picTest) userInfo:nil repeats:YES];
}
//计时器停止
- (void)timeStop{
    [self.times invalidate];
    self.times = nil;
    
}
- (void)picTest{
    self.a ++;
    if (self.a == _arrPics.count-1) {
        self.a = 0;
        self.page.currentPage = 0;
    }else{
        self.page.currentPage = self.a;
    }
    
    self.i ++;
    if (self.i == _arrPics.count) {
    
        self.i = 0;
        self.i++;
        [self.scroll setContentOffset:CGPointMake(0, 0) animated:NO];
    }

        [self.scroll setContentOffset:CGPointMake(WIDTH * self.i, 0) animated:YES];
   
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self requestData];
}

#pragma mark -- 获取网络数据
- (void)requestData{
    [H_requestDateService requestDataWithDictionary:@{@"discount":@"1"} andSuccess:^(NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
    }];
    
    [H_requestDateService requestDataWithDictionary:@{@"new":@"1"} andSuccess:^(NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
    }];
}


#pragma mark  --UICollectionViewDataSource
// 定义展示的UIcollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// 定义展示Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

// 定义每个CollectionViewCell展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier;
    
    if (indexPath.section == 0) {
        cellIdentifier = @"homeCollectionCell1";
    }else{
        cellIdentifier = @"homeCollectionCell2";
    }
    
    H_CollectionViewCell1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.picture.image = [UIImage imageNamed:@"38"];
    cell.titleLab.text = @"男士春款限时抢购满100立减20";
    cell.priceLab.text = @"￥159";
    cell.numberLab.text = @"2000";
    return cell;
}

// 定义组名
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"001" forIndexPath:indexPath];
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 320, 34)];
    backView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:backView];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 260, 34)];
    titleLab.font = [UIFont systemFontOfSize:15];
    [backView addSubview:titleLab];
    
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(270, 0, 50, 34)];
    
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [moreBtn setTitle:@"更多》" forState:UIControlStateNormal];
    [moreBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(goMore:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:moreBtn];
    
    if (indexPath.section == 0) {
        titleLab.text = @"天天活动";
        moreBtn.tag = 1001;
    }else if (indexPath.section == 1){
        titleLab.text = @"新品上市";
        moreBtn.tag = 1002;
    }else{
        
    }
    return headView;
}

#pragma mark -- UICollectionViewDelegateFlowLayouy
// 定义每个Item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size;
    if (indexPath.section == 0) {
        size = CGSizeMake(159, 185);
    }else if (indexPath.section == 1){
        size = CGSizeMake(320, 140);
    }
    return size;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(320, 40);
}


// 定义每个CollectionView的margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark --UICollectionViewDelegate
// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    NSLog(@"%@",indexPath);
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

// 返回UICollectionView是否可被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


//
- (void)goMore:(UIButton *)sender{
    
    if (sender.tag == 1001) {
        MoreViewController *more = [[MoreViewController alloc]init];
        more.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:more animated:YES];
    }else if (sender.tag == 1002){
        NewClothesViewController *new=[[NewClothesViewController alloc]init];
        new.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:new animated:YES];
    }
    
    
    
}

#pragma mark -- 城市列表
- (void)chooseCity{
    CityListView *city = [[CityListView alloc]init];
    city.delegate = self;
    city.hidesBottomBarWhenPushed = YES;  //下一页隐藏底部导航
    [self.navigationController pushViewController:city animated:YES];
 
   
}



@end
