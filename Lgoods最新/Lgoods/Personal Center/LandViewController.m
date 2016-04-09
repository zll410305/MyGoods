//
//  LandViewController.m
//  Lgoods
//
//  Created by administrator on 16/4/8.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "LandViewController.h"
#import "RegViewController.h"
#import "MyNavigation.h"
@interface LandViewController ()
@property (strong, nonatomic) MyNavigation *mynav;//自定义导航栏

@property (strong,nonatomic)UILabel *namelab;

@property (strong,nonatomic)UILabel *numlab ;

@property (strong,nonatomic)UILabel *nalab;

@property (strong,nonatomic)UITextField *nametext;

@property (strong,nonatomic)UITextField *numtext;

@property (strong,nonatomic)UIButton *but1;

@property (strong,nonatomic)UIButton *but2;

@property (strong,nonatomic)UIButton *but3;

@property (strong,nonatomic)UIView *vie;

@property (strong,nonatomic)UIButton *but;




@end

@implementation LandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str=@"登录";
    self.mynav=[[MyNavigation alloc]initWithBgimg:nil andWithTitlelab:str andWithtitleimg:nil andWithLeftbut:nil andWithRight:nil];
    
    self.but=[[UIButton alloc]initWithFrame:CGRectMake(10, 30, 10, 15)];
    [self.but setImage:[UIImage imageNamed:@"jiantou1.png"] forState:UIControlStateNormal];
    
    [self.but setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    [self.but addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.mynav addSubview:self.but];

    
    [self.view addSubview:self.mynav];
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    //自定义view
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    self.vie=[[UIView alloc]initWithFrame:CGRectMake(10, 100, 300, 112)];
    self.vie.layer.cornerRadius=10.0;
    self.vie.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.vie];
    
    
    //账号
    self.namelab=[[UILabel alloc]initWithFrame:CGRectMake(40, 10, 40, 40)];
    self.namelab.text=@"账号 ";
    [self.vie addSubview:self.namelab];
    
    //横线
    UILabel *lin=[[UILabel alloc]initWithFrame:CGRectMake(5, 56, 290, 1)];
    lin.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.vie addSubview:lin];
    
    //密码
    self.numlab=[[UILabel alloc]initWithFrame:CGRectMake(40, 66, 40, 40)];
    self.numlab.text=@"密码 ";
    [self.vie addSubview:self.numlab];
    
    //填写账号
    
    self.nametext=[[UITextField alloc]initWithFrame:CGRectMake(100, 12, 90, 40)];
    self.nametext.placeholder=@"手机号码";
    self.nametext.font=[UIFont systemFontOfSize:12];
    [self.vie addSubview:self.nametext];
    
    //填写密码
    self.numtext=[[UITextField alloc]initWithFrame:CGRectMake(100, 66, 90, 40)];
    self.numtext.placeholder=@"请输入密码";
    self.numtext.font=[UIFont systemFontOfSize:12];
    [self.vie addSubview:self.numtext];
    
    
    //登陆but
    self.but1=[[UIButton alloc]initWithFrame:CGRectMake(8, 270, 300, 40)];
    self.but1.backgroundColor=[UIColor orangeColor];
    self.but1.layer.cornerRadius=10;
    [self.but1 setTitle:@"登陆" forState:UIControlStateNormal];
    [self.but1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
    [self.but1 setTitleColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.1] forState:UIControlStateHighlighted];
    
    [self.but1 addTarget:self action:@selector(but1test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.but1];
    
    
    
    //忘记密码but
    self.but2=[[UIButton alloc]initWithFrame:CGRectMake(20, 330, 80, 40)];
    [self.but2 setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.but2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
    [self.but2 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.but2 addTarget:self action:@selector(but2test) forControlEvents:UIControlEventTouchUpInside];
    self.but2.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:self.but2];
    
    
    //快速登陆but
    self.but3=[[UIButton alloc]initWithFrame:CGRectMake(220, 330, 80, 40)];
    [self.but3 setTitle:@"注册账号" forState:UIControlStateNormal];
    [self.but3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal] ;
    [self.but3 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.but3 addTarget:self action:@selector(but3test) forControlEvents:UIControlEventTouchUpInside];
    
    self.but3.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:self.but3];
    
    
    
    
}




-(void)but1test{
    
    
    
    
    
}


-(void)but2test{
    
    
    
}

-(void)but3test{
    
    RegViewController *rec=[[RegViewController alloc]init];
    //    [self presentViewController:ecr animated:YES completion:nil];
    self.nalab.text=@"注册";
    [self.navigationController pushViewController:rec animated:YES];
    
    
}


-(void)lefttest{
    
    
    
    
    
}


-(void)back{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


@end
