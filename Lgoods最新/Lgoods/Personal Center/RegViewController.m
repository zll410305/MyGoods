//
//  RegViewController.m
//  Lgoods
//
//  Created by administrator on 16/4/8.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "RegViewController.h"
#import "MyNavigation.h"
#import "Myrequst.h"
@interface RegViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) MyNavigation *mynav2;//自定义导航栏

@property (strong,nonatomic)UIView *vie;

@property (strong,nonatomic)UILabel *wordlab;

@property (strong,nonatomic)UILabel *numlab;

@property (strong,nonatomic)UILabel *mywordlab;

@property (strong,nonatomic)UILabel *namelab;

@property (strong,nonatomic)UITextField *wordtext;

@property (strong,nonatomic)UITextField *numtext;

@property (strong,nonatomic)UITextField *mywordtext;

@property (strong,nonatomic)UITextField *nametext;

@property (strong,nonatomic)UIButton *secbut1;

@property (strong,nonatomic)UIButton *secbut2;

@property (copy,nonatomic)NSString *mun2;

@property (strong,nonatomic)UIButton *but;


@end

@implementation RegViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *str=@"登录";
    self.mynav2=[[MyNavigation alloc]initWithBgimg:nil andWithTitlelab:str andWithtitleimg:nil andWithLeftbut:nil andWithRight:nil];
    
    self.but=[[UIButton alloc]initWithFrame:CGRectMake(10, 30, 10, 15)];
    [self.but setImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    
    [self.but setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.but addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.mynav2 addSubview:self.but];
    
    
    [self.view addSubview:self.mynav2];
    
    
    self.mun2=@"86";
    self.view.backgroundColor=[UIColor whiteColor];
    
    //自定义view
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(10, 100, 300, 228)];
    self.vie.layer.cornerRadius=10.0;
    self.vie.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.vie];
    
    
    //手机号
    self.wordlab=[[UILabel alloc]initWithFrame:CGRectMake(40, 10, 60, 40)];
    self.wordlab.text=@"手机号 ";
    [self.vie addSubview:self.wordlab];
    
    //横线
    UILabel *lin=[[UILabel alloc]initWithFrame:CGRectMake(5, 56, 290, 1)];
    lin.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.vie addSubview:lin];
    
    
    UILabel *lin2=[[UILabel alloc]initWithFrame:CGRectMake(5, 112, 290, 1)];
    lin2.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.vie addSubview:lin2];
    
    
    UILabel *lin3=[[UILabel alloc]initWithFrame:CGRectMake(5, 168, 290, 1)];
    lin3.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.vie addSubview:lin3];
    
    
    
    
    //验证码
    self.numlab=[[UILabel alloc]initWithFrame:CGRectMake(40, 66, 60, 40)];
    self.numlab.text=@"验证码 ";
    [self.vie addSubview:self.numlab];
    
    
    //密码
    self.mywordlab =[[UILabel alloc]initWithFrame:CGRectMake(40, 122, 60, 40)];
    self.mywordlab.text=@"密码";
    [self.vie addSubview:self.mywordlab];
    
    
    //昵称
    self.namelab =[[UILabel alloc]initWithFrame:CGRectMake(40, 178, 60, 40)];
    self.namelab.text=@"昵称";
    [self.vie addSubview:self.namelab];
    
    
    
    //填写手机号
    
    self.wordtext=[[UITextField alloc]initWithFrame:CGRectMake(120, 12, 90, 40)];
    self.wordtext.placeholder=@"请输入手机号码";
    self.wordtext.font=[UIFont systemFontOfSize:12];
    [self.vie addSubview:self.wordtext];
    
    //填写验证码
    self.numtext=[[UITextField alloc]initWithFrame:CGRectMake(120, 68, 90, 40)];
    self.numtext.placeholder=@"验证码";
    self.numtext.font=[UIFont systemFontOfSize:12];
    [self.vie addSubview:self.numtext];
    
    
    
    //填写密码
    self.mywordtext=[[UITextField alloc]initWithFrame:CGRectMake(120, 124, 90, 40)];
    self.mywordtext.placeholder=@"输入密码";
    self.mywordtext.font=[UIFont systemFontOfSize:12];
    [self.vie addSubview:self.mywordtext];
    
    //填写昵称
    self.nametext=[[UITextField alloc]initWithFrame:CGRectMake(120, 180, 110, 40)];
    self.nametext.placeholder=@"2~8个字符";
    self.nametext.font=[UIFont systemFontOfSize:12];
    [self.vie addSubview:self.nametext];
    
    
    //获取验证码but
    self.secbut2=[[UIButton alloc]initWithFrame:CGRectMake(220, 13, 70, 30)];
    self.secbut2.backgroundColor=[UIColor orangeColor];
    self.secbut2.layer.cornerRadius=15;
    [self.secbut2 setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.secbut2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
    self.secbut2.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.secbut2 setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.1] forState:UIControlStateHighlighted];
    
    [self.secbut2 addTarget:self action:@selector(secbut2test) forControlEvents:UIControlEventTouchUpInside];
    [self.vie addSubview:self.secbut2];
    
    
    
    
    
    //注册but
    self.secbut1=[[UIButton alloc]initWithFrame:CGRectMake(8, 386, 300, 40)];
    self.secbut1.backgroundColor=[UIColor orangeColor];
    self.secbut1.layer.cornerRadius=10;
    [self.secbut1 setTitle:@"注册" forState:UIControlStateNormal];
    [self.secbut1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
    [self.secbut1 setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.1] forState:UIControlStateHighlighted];
    
    [self.secbut1 addTarget:self action:@selector(secbut1test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.secbut1];
    
    
    
    
    
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
    
    
}

-(void)secbut1test{
    
    
    [SMSSDK commitVerificationCode:self.numtext.text phoneNumber:self.wordtext.text zone:_mun2 result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"验证成功");
            NSLog(@"%@",error);
            
        }
        else
        {
            NSLog(@"错误信息:%@",error);
        }
    }];
    
    [Myrequst Write:self.nametext.text andWith:self.mywordtext.text andWith:self.wordtext.text];
        
}




-(void)secbut2test{
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.wordtext.text
                                   zone:_mun2
                       customIdentifier:nil
                                 result:^(NSError *error){
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                     } else {
                                         NSLog(@"错误信息：%@",error);}
                                 }];
    
    
    
    
    
}



-(void)back{
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
  }


@end
