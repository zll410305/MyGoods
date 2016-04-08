//
//  ShopViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "ShopViewController.h"
#import "SearViewController.h"
#import "ShopCollectionViewCell.h"
#import "ChatViewController.h"
#import "ShopDetailViewController.h"
#import "DetailViewController.h"
@interface ShopViewController ()<UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //导航栏
    self.view.backgroundColor=[UIColor whiteColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    self.vie.backgroundColor=[UIColor orangeColor];
    self.leftbut=[[UIButton alloc]initWithFrame:CGRectMake(10, self.vie.frame.size.height-30, 10, 15)];
    [self.leftbut setImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    
    [self.leftbut setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [self.leftbut addTarget:self action:@selector(back2) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.leftbut];
    
    [self.view addSubview:self.vie];
    
    
    
    self.clttext=[[UITextField alloc]initWithFrame:CGRectMake(80, 28, 190, 25)];
    self.clttext.backgroundColor=[UIColor whiteColor];
    self.clttext.textAlignment=  NSTextAlignmentCenter;
    self.clttext.layer.cornerRadius=5;
    self.clttext.placeholder=@"搜索";
    UIImageView *imge=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 15, 15)];
    imge.image=[UIImage imageNamed:@"搜索"];
    [self.clttext addSubview:imge];
    self.clttext.font=[UIFont systemFontOfSize:12];
    self.clttext.delegate=self;
    [self.vie addSubview:self.clttext];
    
    
    //信息数组
    
    self.arr=@[@"31.png",@"32.png",@"33.png",@"31.png",@"32.png",@"33.png",@"31.png",@"32.png",@"33.png",@"31.png"];
    
    self.arr2=@[@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣",@"新春春款上衣"];
    self.arr3=@[@"￥125",@"￥130",@"￥500",@"￥350",@"￥225",@"￥339",@"￥299",@"￥199",@"￥499",@"￥245"];
    
    //collection
    
    
    
    //头页面
    
    self.heaview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 72)];
    UIImageView *heaimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.heaview.frame.size.width, self.heaview.frame.size.height)];
    heaimg.image=[UIImage imageNamed:@"ME.png"];
    [self.heaview addSubview:heaimg];
    
    
    
    //头页面2
    self.heaview2=[[UIView alloc]initWithFrame:CGRectMake(0, 136, self.view.frame.size.width, 50)];
    self.heaview2.backgroundColor=[UIColor whiteColor];
    
    self.but1=[[UIButton alloc]initWithFrame:CGRectMake(20, 10, 62, 30)];
    self.but1.titleLabel.font=[UIFont systemFontOfSize:15];
    self.but1.tag=100;
    [self.but1 setTitle:@"女上衣" forState:UIControlStateNormal];
    [self.but1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.but1 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.but1 addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];
    [self.heaview2 addSubview:self.but1];
    
    
    self.but2=[[UIButton alloc]initWithFrame:CGRectMake(92, 10, 62, 30)];
      self.but2.titleLabel.font=[UIFont systemFontOfSize:15];
    self.but2.tag=101;
    [self.but2 setTitle:@"女裤" forState:UIControlStateNormal];
    [self.but2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.but2 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.but2 addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];

    [self.heaview2 addSubview:self.but2];

    
    self.but3=[[UIButton alloc]initWithFrame:CGRectMake(170, 10, 62, 30)];
      self.but3.titleLabel.font=[UIFont systemFontOfSize:15];
    self.but3.tag=102;
    [self.but3 setTitle:@"男上衣" forState:UIControlStateNormal];
    [self.but3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.but3 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.but3 addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];

    [self.heaview2 addSubview:self.but3];

    
    
    
    self.but4=[[UIButton alloc]initWithFrame:CGRectMake(242, 10, 62, 30)];
      self.but4.titleLabel.font=[UIFont systemFontOfSize:15];
    self.but4.tag=103;
    [self.but4 setTitle:@"男裤" forState:UIControlStateNormal];
    [self.but4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.but4 setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [self.but4 addTarget:self action:@selector(test1:) forControlEvents:UIControlEventTouchUpInside];

    [self.heaview2 addSubview:self.but4];

    
    //底部页面
    
    //客服块
    self.tabview=[[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
    self.tabview.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:self.tabview];
    
    self.tabbut1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.tabbut1.backgroundColor=[UIColor whiteColor];
    self.tabbut1.layer.borderWidth=0.5;
    self.tabbut1.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
    [self.tabbut1 addTarget:self action:@selector(tabtest) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *seimg=[[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 25, 25)];
    seimg.image=[UIImage imageNamed:@"客服.png"];
    [self.tabbut1 addSubview:seimg];
    UILabel *sevlab=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, 25, 20)];
    sevlab.text=@"客服";
    sevlab.textColor=[UIColor grayColor];
    sevlab.font=[UIFont systemFontOfSize:12];
    [self.tabbut1 addSubview:sevlab];
    [self.tabview addSubview:self.tabbut1];
    
    //收藏
    
    self.tabbut2=[[UIButton alloc]initWithFrame:CGRectMake(50, 0, 135, 50)];
    self.tabbut2.backgroundColor=[UIColor colorWithRed:255.0/255.0 green:155.0/255.0 blue:0 alpha:1];
    [self.tabbut2 setTitle:@"收藏" forState:UIControlStateNormal];
    [self.tabbut2 addTarget:self action:@selector(tabtest2) forControlEvents:UIControlEventTouchUpInside];
    [self.tabview addSubview:self.tabbut2];

    //店铺简介
    self.tabbut3=[[UIButton alloc]initWithFrame:CGRectMake(185, 0, 135, 50)];
    [self.tabbut3 setTitle:@"店家详情" forState:UIControlStateNormal];
    [self.tabbut3 addTarget:self action:@selector(tabtest3) forControlEvents:UIControlEventTouchUpInside];

    [self.tabview addSubview:self.tabbut3];
    
    
    
    //确定滚动竖直滚动
    UICollectionViewFlowLayout *fiow=[[UICollectionViewFlowLayout alloc]init];
    [fiow setScrollDirection:  UICollectionViewScrollDirectionVertical];
    [fiow setMinimumInteritemSpacing:3.0];
    [fiow setMinimumLineSpacing:1.0];
    //
    self.shopcollection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-114)collectionViewLayout:fiow];
    self.shopcollection.backgroundColor=[UIColor groupTableViewBackgroundColor];
    self.shopcollection.delegate = self;
    self.shopcollection.dataSource=self;
//注册cell
    [self.shopcollection registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:@"c"];
    [self.shopcollection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"resu"];
    [self.view addSubview:self.shopcollection];
    
    
    [self.view addSubview:self.heaview2];
    
    
    
  

}





-(void)back2{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    SearViewController *sear = [[SearViewController alloc]init];
    sear.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:sear animated:YES];
    
    return NO;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return _arr.count;
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    return 1;
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(158, 275);
    
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    
  return CGSizeMake(self.view.frame.size.width, 122);


    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
           static NSString *str=@"c";
        ShopCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:str forIndexPath:indexPath];
      cell.img.image=[UIImage imageNamed:_arr[indexPath.row]];
      cell.lab1.text=_arr2[indexPath.row];
      cell.lab2.textColor=[UIColor redColor];
      cell.lab2.text =_arr3[indexPath.row];
        return cell;
  
    
    

    
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
    
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    
    UICollectionReusableView *headview=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"resu" forIndexPath:indexPath];
    
    [headview addSubview:self.heaview];
    
   
    
    return headview;
    
    
    
}


-(void)test1:(UIButton*)sender{
    
    self.but1.selected=NO;
     self.but2.selected=NO;
     self.but3.selected=NO;
     self.but4.selected=NO;
    
    switch (sender.tag) {
        case 100:
            self.but1.selected=YES;
            break;
        case 101:
            self.but2.selected=YES;
            break;
        case 102:
            self.but3.selected=YES;
            break;
        case 103:
            self.but4.selected=YES;
            break;


        default:
            break;
    }
    
    
    
}

-(void)tabtest{
    
    
    //新建一个聊天会话View Controller对象
    ChatViewController *chat = [[ChatViewController alloc]init];
    //设置会话的类型，如单聊、讨论组、群聊、聊天室、客服、公众服务会话等
    chat.conversationType = ConversationType_PRIVATE;
    //设置会话的目标会话ID。（单聊、客服、公众服务会话为对方的ID，讨论组、群聊、聊天室为会话的ID）
    chat.targetId = @"123456";
    //设置聊天会话界面要显示的标题
    chat.title = @"会话";
    //显示聊天会话界面
    [self.navigationController pushViewController:chat animated:YES];
    
    
}
-(void)tabtest2{
    
    
    
    
    
}

-(void)tabtest3{
    
    [self.navigationController pushViewController:[[ShopDetailViewController alloc]init] animated:YES];
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat hea2=self.shopcollection.contentOffset.y;
    if (0< hea2 && hea2 <74) {
        self.heaview2.frame=CGRectMake(0, 136-hea2, self.view.frame.size.width, 50);
        
    }

    
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return YES;
    
    
    
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
        [self.navigationController pushViewController:[[DetailViewController alloc]init] animated:YES];
    NSLog(@"heh");
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
