//
//  OrderViewController.m
//  Lgoods
//
//  Created by Administrator on 16/3/30.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "OrderViewController.h"

#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

@interface OrderViewController ()

@property (strong, nonatomic)NSArray *orderArr;  //定单详情

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //订单页面
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 20, 60, 44)];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:backBtn];
   
    self.orderArr = @[@"收件人:",@"联系电话:",@"衣服名:",@"颜色:",@"尺寸:",@"收货地址:",@"买家留言:",@"支付金额:"];
    
    for (int i = 0; i<_orderArr.count; i ++) {
        
        UILabel *orderLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 64+10+i*40, 65, 20)];
        orderLab.text = self.orderArr[i];
        orderLab.font = [UIFont systemFontOfSize:13];
        orderLab.textAlignment = NSTextAlignmentRight;
        [self.view addSubview:orderLab];
        
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(10, 64+40*(i+1), SCREEN_WIDTH-20, 1)];
        line.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.view addSubview:line];
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(90, 64+5+i*40, SCREEN_WIDTH-80-30,30)];
        textField.font = [UIFont systemFontOfSize:20];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
        textField.layer.borderWidth = 1.0f;
        [self.view addSubview:textField];
        NSLog(@"%@",textField);

    }
    
    UIButton *payBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 400, SCREEN_WIDTH-30, 40)];
    payBtn.backgroundColor = [UIColor orangeColor];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    payBtn.layer.cornerRadius = 10;
    
    [payBtn setTitle:@"确定支付" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payMoney) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

//跳转支付页面
- (void)payMoney{
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


@end
