//
//  DetailViewController.m
//  Lgoods
//
//  Created by Administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "DetailViewController.h"
#import "OrderViewController.h"
#import "ChatViewController.h"
#import "EvaluateViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface DetailViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic)UIScrollView *bigScroll;

@property (strong, nonatomic)UIScrollView *picScroll;

@property (strong, nonatomic)UIView *selectView;

@property (strong, nonatomic)UILabel *numLab;

@property (assign, nonatomic)int num;

@property (strong, nonatomic)NSDictionary *getDic;

@property (strong, nonatomic)NSString *clotherColor;

@property (strong, nonatomic)NSString *clotherSize;

@property (strong, nonatomic)UIButton *nextBtn;

@property (strong, nonatomic)UIButton *shopCar;

@property (strong, nonatomic)UIButton *serviceBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
    
    NSArray *picArr = @[@"8107F5C542332AAC8CE221C7CF26A055.png",@"5E29AEA762416425A92601FAD091BF06.png",@"EA328D236FA008AB2ECE92464E179D65.png"];
    
    self.bigScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.bigScroll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT+320);
    self.bigScroll.delegate = self;
    self.bigScroll.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_bigScroll];
    
    self.picScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 426)];
    self.picScroll.delegate = self;
    self.picScroll.contentSize = CGSizeMake(SCREEN_WIDTH*picArr.count, 426);
    self.picScroll.pagingEnabled = YES;
    [self.bigScroll addSubview:_picScroll];
    for (int i = 0; i < picArr.count; i++) {
        UIImageView *pic = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, 426)];
        pic.image = [UIImage imageNamed:picArr[i]];
        [self.picScroll addSubview:pic];
    }
    
    
    UIView *priceview = [[UIView alloc]initWithFrame:CGRectMake(0, _picScroll.frame.size.height + 10, SCREEN_WIDTH, 45)];
    priceview.backgroundColor = [UIColor whiteColor];
    [self.bigScroll addSubview:priceview];
    
    UILabel *priceLabe = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 25)];
    priceLabe.textColor = [UIColor redColor];
    priceLabe.font = [UIFont systemFontOfSize:15];
    priceLabe.text = @"￥229.00";
    [priceview addSubview:priceLabe];
    
    UIView *commentview = [[UIView alloc]initWithFrame:CGRectMake(0, priceview.frame.origin.y + priceview.frame.size.height + 10, SCREEN_WIDTH, 45)];
    commentview.backgroundColor = [UIColor whiteColor];
    [self.bigScroll addSubview:commentview];
    
    UIButton *commentBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    commentBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [commentBtn setTitle:@"晒单评价（10）" forState:UIControlStateNormal];
    [commentBtn addTarget:self action:@selector(goEvaluate) forControlEvents:UIControlEventTouchUpInside];
    [commentview addSubview:commentBtn];
    
    UIView *shopView = [[UIView alloc]initWithFrame:CGRectMake(0, commentview.frame.origin.y + commentview.frame.size.height + 10, SCREEN_WIDTH, 45)];
    shopView.backgroundColor = [UIColor whiteColor];
    [self.bigScroll addSubview:shopView];
    
    UILabel *shopName = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 45)];
    shopName.font = [UIFont systemFontOfSize:15];
    shopName.textAlignment = NSTextAlignmentCenter;
    shopName.text = @"海澜之家";
    [shopView addSubview:shopName];
    
    UIButton *enterShop = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, 0, SCREEN_WIDTH/2 - 20, 45)];
    enterShop.titleLabel.font = [UIFont systemFontOfSize:12];
    [enterShop setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [enterShop setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [enterShop setTitle:@"进入店铺 >" forState:UIControlStateNormal];
    [enterShop addTarget:self action:@selector(goToShop:) forControlEvents:UIControlEventTouchUpInside];
    [shopView addSubview:enterShop];
    
    UIView *clothesInfoview = [[UIView alloc]initWithFrame:CGRectMake(0, shopView.frame.origin.y + shopView.frame.size.height + 10, SCREEN_WIDTH, 185)];
    clothesInfoview.backgroundColor = [UIColor whiteColor];
    [self.bigScroll addSubview:clothesInfoview];
    
    UILabel *clothesInfoLabe = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 45)];
    clothesInfoLabe.textAlignment = NSTextAlignmentCenter;
    clothesInfoLabe.font = [UIFont systemFontOfSize:15];
    clothesInfoLabe.text = @"商品信息";
    [clothesInfoview addSubview:clothesInfoLabe];
    
    UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(10, clothesInfoLabe.frame.origin.y + clothesInfoLabe.frame.size.height, SCREEN_WIDTH-20, 1)];
    lineLab.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [clothesInfoview addSubview:lineLab];
    
    UILabel *numLab = [[UILabel alloc]initWithFrame:CGRectMake(10, clothesInfoLabe.frame.origin.y + clothesInfoLabe.frame.size.height + 10, SCREEN_WIDTH/2 -20, 15)];
    numLab.font = [UIFont systemFontOfSize:12];
    numLab.text = @"编号：123456";
    [clothesInfoview addSubview:numLab];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 +10, clothesInfoLabe.frame.origin.y + clothesInfoLabe.frame.size.height + 10, SCREEN_WIDTH/2 -20, 15)];
    nameLab.font = [UIFont systemFontOfSize:12];
    nameLab.text = @"名称：上衣";
    [clothesInfoview addSubview:nameLab];
    
    UILabel *describeLab = [[UILabel alloc]initWithFrame:CGRectMake(10, clothesInfoLabe.frame.origin.y + clothesInfoLabe.frame.size.height, SCREEN_WIDTH-20, 105)];
    describeLab.font = [UIFont systemFontOfSize:12];
    describeLab.text = @"11111111111111111";
    [clothesInfoview addSubview:describeLab];
    
    [self addChoseView];
    
    UIView *tabView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-49, SCREEN_WIDTH, 49)];
    tabView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:tabView];
    
    self.serviceBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/6, 49)];
    [self.serviceBtn setTitle:@"客服" forState:UIControlStateNormal];
    [self.serviceBtn addTarget:self action:@selector(chatService:) forControlEvents:UIControlEventTouchUpInside];
    [tabView addSubview:self.serviceBtn];
    
    self.shopCar = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/6, 0, SCREEN_WIDTH/3, 49)];
    [self.shopCar setTitle:@"购物车" forState:UIControlStateNormal];
    [self.shopCar addTarget:self action:@selector(addShopCar:) forControlEvents:UIControlEventTouchUpInside];
    [tabView addSubview:self.shopCar];
    
    self.nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 49)];
    [self.nextBtn setTitle:@"购买" forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(choseClothes:) forControlEvents:UIControlEventTouchUpInside];
    [tabView addSubview:self.nextBtn];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 44)];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
    
    // Do any additional setup after loading the view.
}

- (void)goToShop:(UIButton *)sender{
    
}

- (void)goEvaluate{
    EvaluateViewController *evaluate = [[EvaluateViewController alloc]init];
    [self.navigationController pushViewController:evaluate animated:YES];
}


//   客服
- (void)chatService:(UIButton *)button{
    
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

//   购物车
- (void)addShopCar:(UIButton *)button{
    
}

// 返回
- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

//  选择衣服
- (void)addChoseView{
    
    self.selectView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200)];
    self.selectView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.selectView];
    
    self.getDic = @{
                          @"color":@[@"红",@"绿",@"蓝",@"白",@"黑",@"黄"],
                          @"size":@[@"XS",@"S",@"M",@"L",@"XL",@"XXL",],
                          @"count":@"1"
                          };
    UILabel *colorLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 29, 30, 20)];
    colorLab.font = [UIFont systemFontOfSize:12];
    colorLab.text = @"颜色";
    [self.selectView addSubview:colorLab];
    UILabel *sizeLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 79, 30, 20)];
    sizeLab.font = [UIFont systemFontOfSize:12];
    sizeLab.text = @"大小";
    [self.selectView addSubview:sizeLab];
    UILabel *countLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 129, 30, 20)];
    countLab.font = [UIFont systemFontOfSize:12];
    countLab.text = @"数量";
    [self.selectView addSubview:countLab];
    NSArray *colorArr = [_getDic objectForKey:@"color"];
    NSArray *sizeArr = [_getDic objectForKey:@"size"];
    NSString *count = [_getDic objectForKey:@"count"];
    self.num = count.intValue;
    for (int i = 0; i < colorArr.count; i++) {
        UIButton *colorBtn = [[UIButton alloc]initWithFrame:CGRectMake(40 + 30 * i, 29, 30, 20)];
        colorBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [colorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [colorBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [colorBtn setTitle:colorArr[i] forState:UIControlStateNormal];
        colorBtn.tag = 5100+i;
        [colorBtn addTarget:self action:@selector(selectColor:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectView addSubview:colorBtn];
    }
    for (int i = 0; i < sizeArr.count; i++) {
        UIButton *sizeBtn = [[UIButton alloc]initWithFrame:CGRectMake(40 + 30 * i, 79, 30, 20)];
        sizeBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [sizeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [sizeBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [sizeBtn setTitle:sizeArr[i] forState:UIControlStateNormal];
        sizeBtn.tag = 5200+i;
        [sizeBtn addTarget:self action:@selector(selectSize:) forControlEvents:UIControlEventTouchUpInside];
        [self.selectView addSubview:sizeBtn];
    }
    
    UIButton *reducebutton = [[UIButton alloc]initWithFrame:CGRectMake(40, 129, 30, 20)];
    [reducebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reducebutton setTitle:@"-" forState:UIControlStateNormal];
    [reducebutton addTarget:self action:@selector(reduce1:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView addSubview:reducebutton];
    
    self.numLab = [[UILabel alloc]initWithFrame:CGRectMake(70, 129, 30, 20)];
    self.numLab.textAlignment = NSTextAlignmentCenter;
    self.numLab.text = [NSString stringWithFormat:@"%d",_num];
    [self.selectView addSubview:_numLab];
    
    UIButton *plusbutton = [[UIButton alloc]initWithFrame:CGRectMake(100, 129, 30, 20)];
    [plusbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [plusbutton setTitle:@"+" forState:UIControlStateNormal];
    [plusbutton addTarget:self action:@selector(plus1:) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView addSubview:plusbutton];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH - 30, 0, 30, 30)];
    [backBtn setTitle:@"X" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(cancleChose) forControlEvents:UIControlEventTouchUpInside];
    [self.selectView addSubview:backBtn];
    
}

//  取消选择
- (void)cancleChose{
    
    [UIView animateWithDuration:1 animations:^{
        self.selectView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200);
    }];
    [self.nextBtn setTitle:@"购买" forState:UIControlStateNormal];
    
}

// 选择颜色
- (void)selectColor:(UIButton *)sender{
    
    NSArray *colorArr = [_getDic objectForKey:@"color"];
    for (int i = 0; i < colorArr.count; i++) {
        UIButton *button = (UIButton *)[_selectView viewWithTag:5100+i];
        if (button.tag == sender.tag) {
            button.selected = YES;
            self.clotherColor = colorArr[i];
        }else{
            button.selected = NO;
        }
    }
    
    
}

// 选择大小
- (void)selectSize:(UIButton *)sender{
    NSArray *sizeArr = [_getDic objectForKey:@"size"];
    for (int i = 0; i < sizeArr.count; i++) {
        UIButton *button = (UIButton *)[_selectView viewWithTag:5200+i];
        if (button.tag == sender.tag) {
            button.selected = YES;
            self.clotherSize = sizeArr[i];
        }else{
            button.selected = NO;
        }
    }
}

//  购买数量-1
- (void)reduce1:(UIButton *)sender{
    if (_num > 0) {
        self.num--;
        self.numLab.text = [NSString stringWithFormat:@"%d",_num];
    }
}

// 购买数量+1
- (void)plus1:(UIButton *)sender{
    self.num++;
    self.numLab.text = [NSString stringWithFormat:@"%d",_num];
}

// 确定购买
- (void)choseClothes:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"购买"]) {
        [UIView animateWithDuration:1 animations:^{
            self.selectView.frame = CGRectMake(0, SCREEN_HEIGHT-249, SCREEN_WIDTH, 200);
        }];
        [sender setTitle:@"确定" forState:UIControlStateNormal];
    }else if ([sender.titleLabel.text isEqualToString:@"确定"]){
        if (_clotherColor.length > 0 && _clotherSize.length > 0 && _numLab.text.intValue > 0) {
            OrderViewController *order = [[OrderViewController alloc]init];
            [self.navigationController pushViewController:order animated:YES];
        }
    }else{
        
    }
    
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
