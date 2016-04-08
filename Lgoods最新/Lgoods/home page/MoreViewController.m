//
//  MoreViewController.m
//  Lgoods
//
//  Created by Administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "MoreViewController.h"
#import "H_requestDateService.h"
#import "MD_CollectionViewCell.h"
#import "DetailViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface MoreViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)UIScrollView *topScroll;

@property (strong, nonatomic)UIScrollView *bigScroll;

@property (strong, nonatomic)NSArray *typeArr;

@property (strong, nonatomic)UICollectionView *discountCollection;

@property (strong, nonatomic)UIViewController *controller;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.typeArr = @[@"上衣",@"外套",@"衬衫",@"休闲裤",@"牛仔裤",@"羽绒服"];
    
    self.bigScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50+64, SCREEN_WIDTH, SCREEN_HEIGHT-114)];
    self.bigScroll.contentSize = CGSizeMake(SCREEN_WIDTH * _typeArr.count, SCREEN_HEIGHT-114);
    self.bigScroll.pagingEnabled = YES;
    self.bigScroll.delegate = self;
    self.bigScroll.directionalLockEnabled = NO;
    
    //  防止滚到导航栏下面
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_bigScroll];
    

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    [layout setMinimumInteritemSpacing:1];
    [layout setMinimumLineSpacing:2];
    
    self.discountCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-114) collectionViewLayout:layout];
    self.discountCollection.dataSource = self;
    self.discountCollection.delegate = self;
    self.discountCollection.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.discountCollection registerClass:[MD_CollectionViewCell class] forCellWithReuseIdentifier:@"mdcell"];
    [self.bigScroll addSubview:_discountCollection];
    
    
    self.topScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, 320, 50)];
    self.topScroll.contentSize = CGSizeMake(80 * _typeArr.count, 50);
    self.topScroll.backgroundColor = [UIColor whiteColor];
    self.topScroll.delegate = self;
    [self.view addSubview:_topScroll];
    
    for (int i = 0; i < _typeArr.count; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(80*i, 0, 80, 50)];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitle:_typeArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 4000 + i;
        if (i == 0) {
            btn.selected = YES;
        }
        [self.topScroll addSubview:btn];
    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 44)];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    // Do any additional setup after loading the view.
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)requestData{
    
    NSDictionary *dic = @{
                          @"discount":@"1"};
    [H_requestDateService requestDataWithDictionary:dic andSuccess:^(NSDictionary *resultDic) {
        
    }];
    
}


/**
 *  顶部Scroll按钮选择
 *
 *  @param scrollView <#scrollView description#>
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int k = (int)self.bigScroll.contentOffset.x/SCREEN_WIDTH;
    for (int i = 0; i < _typeArr.count; i++) {
        UIButton *btn = (UIButton *)[self.topScroll viewWithTag:4000+i];
        if (btn.tag == 4000+k) {
            btn.selected = YES;
        }else{
            [btn setSelected:NO];
        }
    }
    self.discountCollection.frame = CGRectMake(SCREEN_WIDTH*k, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 114);
}

/**
 *  顶部Scroll移动位置
 *
 *  @param scrollView          <#scrollView description#>
 *  @param velocity            <#velocity description#>
 *  @param targetContentOffset <#targetContentOffset description#>
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    self.topScroll.contentOffset = CGPointMake(self.bigScroll.contentOffset.x*(80*(_typeArr.count+1)-SCREEN_WIDTH)/(_typeArr.count*SCREEN_WIDTH), 0);
    
}

/**
 *  顶部服装类型点击事件
 *
 *  @param sender <#sender description#>
 */
- (void)selectType:(UIButton *)sender{
    int k = (int)self.bigScroll.contentOffset.x/SCREEN_WIDTH;
    self.discountCollection.frame = CGRectMake(SCREEN_WIDTH*k, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 114);
    for (int i = 0; i < _typeArr.count; i++) {
        UIButton *btn = (UIButton *)[self.topScroll viewWithTag:4000+i];
        if (btn.tag == sender.tag) {
            btn.selected = YES;
        }else{
            [btn setSelected:NO];
        }
    }
    [self.bigScroll setContentOffset:CGPointMake((int)(sender.tag - 4000)*SCREEN_WIDTH, 0) animated:YES];
}


//- (void)requestData{
//    NSDictionary *dic = @{
//                          @"discount":@"1",
//                          @"type":_clothesType};
//    [H_requestDateService requestDataWithDictionary:dic andSuccess:^(NSDictionary *resultDic) {
//        
//    }];
//    [self.discountCollection reloadData];
//}

#pragma mark  --UICollectionViewDataSource
// 定义展示的UIcollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

// 定义展示Section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

// 定义每个CollectionViewCell展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"mdcell";
    
    MD_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.picture.image = [UIImage imageNamed:@"38"];
    cell.titleLab.text = @"男士春款限时抢购满100立减20";
    cell.priceLab.text = @"￥159";
    cell.numberLab.text = @"2000";
    return cell;
}


#pragma mark -- UICollectionViewDelegateFlowLayouy
// 定义每个Item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(159, 185);
}

// 定义每个CollectionView的margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark --UICollectionViewDelegate
// UICollectionView被选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    DetailViewController *detail = [[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:YES];
    
}

// 返回UICollectionView是否可被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
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
