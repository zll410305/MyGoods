//
//  GudeViewController.m
//  Lgoods
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 NSObject. All rights reserved.
//

#import "GudeViewController.h"
#import "HomeViewController.h"
@interface GudeViewController ()<UIScrollViewDelegate>
@property (strong,nonatomic)UIPageControl *pageControl;
@end

@implementation GudeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    UIScrollView *sc=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    sc.contentSize=CGSizeMake(self.view.frame.size.width*3, self.view.frame.size.height);
    sc.pagingEnabled=YES;
    sc.delegate=self;
    [self.view addSubview:sc];
    
    self.pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(115, self.view.frame.size.height-48, self.view.frame.size.width-230, 20)];
   
    self.pageControl.currentPage=0;
    self.pageControl.numberOfPages=3;
    [self.view addSubview:self.pageControl];
    
    UIImageView *img1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    img1.image=[UIImage imageNamed:@"1.png"];
    [sc addSubview:img1];
    

    UIImageView *img2=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
    img2.image=[UIImage imageNamed:@"2.png"];
    [sc addSubview:img2];
    
    UIImageView *img3=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, self.view.frame.size.height)];
    img3.image=[UIImage imageNamed:@"3.png"];
    img3.userInteractionEnabled=YES;
    [sc addSubview:img3];
    
    UIButton *but=[[UIButton alloc]initWithFrame:CGRectMake(98, self.view.frame.size.height-98, self.view.frame.size.width-2*98, 30)];
    [but setTitle:@"进入应用" forState:UIControlStateNormal];
    but.titleLabel.font =[UIFont systemFontOfSize:20];
    but.backgroundColor=[UIColor colorWithRed:91.0/255.0 green:97.0/255.0 blue:104.0/255.0 alpha:1];
    but.layer.cornerRadius=5;
    [but setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    
    [img3 addSubview:but];
}




-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int page = (scrollView.contentOffset.x / scrollView.bounds.size.width);
    if(page != _pageControl.currentPage)
    {
        _pageControl.currentPage = page;
    }
    
    
    
}

-(void)test{
    
    
    [self presentViewController:[[HomeViewController  alloc]init] animated:YES completion:nil];
    
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
